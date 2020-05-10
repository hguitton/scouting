require 'open-uri'
require 'uri'

class PlayerInfos
  include ApplicationHelper
  attr_accessor :infos

  def initialize(url)
    @infos = {}
    if url =~ URI::regexp
      doc = Nokogiri::HTML(open(url, 'Cookie' => ENV["COOKIE"]))
      doc.css('#teamlogo div>div>div b').each do |row|
        scrape_row(row)
      end
      @infos[:name] = scrape_name(doc.css('.playertitle'))
      @infos[:photo] = scrape_photo(doc.css('#PlayerInfo'))
      @infos[:stats] = scrape_stats(doc.css("#divStatsData"))
    end
  end

  private
  def scrape_row(row)
    case row.text.strip[0...-1].downcase
    when 'height'
      @infos[:height] = scrape_numbers(text_content(row))
    when 'weight'
      @infos[:weight] = scrape_numbers(text_content(row))
    when 'born'
      @infos[:birthdate] = scrape_birthdate(text_content(row))
    when 'nationality'
      @infos[:nationality] = scrape_nationality(text_content(row))
    when 'college'
      @infos[:college] = scrape_basic(link_content(row))
    when 'agency', 'agent'
      @infos[:agent] = scrape_basic(link_content(row))
    when 'position'
      @infos[:position] = Position.find_by(name: scrape_basic(text_content(row)))&.id
    when 'team'
      @league = scrape_basic(link_content(row)).split.last.tr('()', '')
    end
  end

  def scrape_name(row)
    name = row.text[1..-1].split[0...-2].join(" ").gsub(/\u00a0/, ' ').split
    name[0] = name[0].capitalize
    name.join(" ")
  end

  def scrape_photo(row)
    img = row.css('img')
    return "" if img.empty?
    img[0]['src']
  end

  def scrape_numbers(content)
    content.split('/')[0].strip[0...-2]
  end

  def scrape_basic(content)
    content.strip
  end

  def scrape_birthdate(content)
    date = Date.parse(content.strip) rescue nil
    date.strftime('%d-%m-%Y') unless date.nil?
  end

  def scrape_nationality(content)
    nationality = content.strip.split('-').first
    countries_list.each do |c|
      return c["name"] if c["nationalities"].include? nationality
    end
    return ""
  end

  def scrape_stats(content)
    stats = {}
    row = content.css('h4')[0]&.text&.split
    return stats unless row
    header = ""
    title = content.css('h4').map(&:text).select{|t| t.include?(@league)}.first
  
    stats[:name] = title.split[1].gsub('-', ' - ')
    stats[:country] = title[/\(.*?\)/].tr('()', '')

    table = content.xpath("//h4[text()='#{title}']/following-sibling::table")[1]
    line = table&.css('.my_pStats1')&.css('td').map(&:text)
    stats[:team] = line[0]
    stats[:min] = line[2]
    stats[:points] = line[3]
    stats[:fgp] = line[4]
    stats[:three_fgp] = line[5]
    stats[:orb] = line[7]
    stats[:drb] = line[8]
    stats[:trb] = line[9]
    stats[:ast] = line[10]
    stats[:blk] = line[12]
    stats[:stl] = line[13]
    stats
  end

  def text_content(row)
    row.parent.xpath('text()').text
  end

  def link_content(row)
    row.next_element.text
  end
end