require 'open-uri'
require 'uri'

class PlayerInfos
  include ApplicationHelper
  attr_accessor :infos

  def initialize(url)
    @infos = {}
    if url =~ URI::regexp
      doc = Nokogiri::HTML(open(url))
      doc.css('#teamlogo div>div>div b').each do |row|
        scrape_row(row)
      end
      @infos[:name] = scrape_name(doc.css('.playertitle'))
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
    when 'position'
      @infos[:position] = scrape_basic(text_content(row))
    end
  end

  def scrape_name(row)
    row.text[1..-1].split[0...-2].join(" ")
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

  def text_content(row)
    row.parent.xpath('text()').text
  end

  def link_content(row)
    row.next_element.text
  end
end