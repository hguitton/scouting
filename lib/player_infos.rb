require 'open-uri'
require 'countries'

class PlayerInfos
  def initialize(url)
    @url = url
    @infos = {}
    # @doc = Nokogiri::HTML(open(url))
    # @doc.css('#teamlogo div>div>div b').each do |row|
    #   scrape_row(row)
    # end
    # @infos[:name] = scrape_name(@doc.css('.playertitle'))
    # puts @infos.inspect.red
    test_c
  end

  private
  def scrape_row(row)
    case row.text.strip[0...-1].downcase
    when 'height'
      @infos[:height] = scrape_numbers(text_content(row))
    when 'weight'
      @infos[:weight] = scrape_numbers(text_content(row))
    when 'born'
      @infos[:born] = scrape_basic(text_content(row))
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

  def scrape_nationality(content)
    #TODO 
  end

  def text_content(row)
    row.parent.xpath('text()').text
  end

  def link_content(row)
    row.next_element.text
  end

  def test_c
    arr = []
    countries.each_with_index do |country, index|
      country = country.split(',')
      name = country[0]
      country.delete(name)
      puts "#{index.inspect.red} - #{name}"
      arr << { name: name, nationalities: country }
    end
    file = File.open('config/data/country.yml', 'w')
    file.puts arr
  end

  def countries
    [
      "Mauritania,Mauritanian,,",
      "Montserrat,Montserratian,,",
      "Malta,Maltese,,",
      "Mauritius,Mauritian,,",
      "Maldives,Maldivan,,",
      "Malawi,Malawian,,",
      "Mexico,Mexican,,",
      "Malaysia,Malaysian,,",
      "Mozambique,Mozambican,,",
      "Namibia,Namibian,,",
      "New Caledonia,New Caledonian,New Caledonians,",
      "Niger,Nigerien,,",
      "Norfolk Island,Norfolk Islander,,",
      "Nigeria,Nigerian,,",
      "Nicaragua,Nicaraguan,Nicoya,",
      "Netherlands,Dutch,,",
      "Norway,Norwegian,,",
      "Nepal,Nepalese,,",
      "Nauru,Nauruan,,",
      "Niue,Niuean,,",
      "New Zealand,New Zealander,,",
      "Oman,Omani,,",
      "Panama,Panamanian,,",
      "Peru,Peruvian,,",
      "French Polynesia,French Polynesian,,",
      "Papua New Guinea,Papua New Guinean,,",
      "Philippines,Filipino,,",
      "Pakistan,Pakistani,,",
      "Poland,Polish,Pole,",
      "St. Pierre and Miquelon,Saint-Pierrais,Miquelonnais,",
      "Pitcairn,Pitcairn Islander,,",
      "Puerto Rico,Puerto Rican,,",
      "Palestine,Palestinian,,",
      "Portugal,Portuguese,Portugese,",
      "Palau,Palauan,,",
      "Paraguay,Paraguayan,,",
      "Qatar,Qatari,,",
      "Réunion,,,",
      "Romania,Romanian,,",
      "Serbia,Serbian,Serb,",
      "Russian Federation,Russian,,",
      "Rwanda,Rwandan,Rwandese,",
      "Saudi Arabia,Saudi Arabian,Saudi,",
      "Solomon Islands,Solomon Islander,,",
      "Seychelles,Seychellois,,",
      "Sudan,Sudanese,,",
      "Sweden,Swedish,Swede,",
      "Singapore,Singaporean,,",
      "Saint Helena,Saint Helenian,,",
      "Slovenia,Slovenian,Slovene,",
      "Svalbard and Jan Mayen Islands,,,",
      "Slovakia,Slovakian,Slovak,",
      "Sierra Leone,Sierra Leonean,,",
      "San Marino,Sanmarinese,Sammarinese,",
      "Senegal,Senegalese,,",
      "Somalia,Somali,,",
      "Suriname,Surinamer,Surinamese,",
      "South Sudan,Sudanese,,",
      "São Tome and Príncipe,São Tomean,Sao Tomean,",
      "El Salvador,Salvadorean,Salvadoran,",
      "Saint Martin (Netherlands),,,",
      "Syria,Syrian,,",
      "Swaziland,Swazi,,",
      "Turks and Caicos Islands,Turks and Caicos Islander,,",
      "Chad,Chadian,,",
      "French Southern Territories,,,",
      "Togo,Togolese,,",
      "Thailand,Thai,,",
      "Tajikistan,Tajikistani,,",
      "Tokelau,Tokelauan,,",
      "Timor-Leste,Timorese,,",
      "Turkmenistan,Turkmen,,",
      "Tunisia,Tunisian,,",
      "Tonga,Tongan,,",
      "Turkey,Turkish,Turk,",
      "Trinidad and Tobago,Trinidadian,Tobagonian,",
      "Tuvalu,Tuvaluan,,",
      "Taiwan,Taiwanese,,",
      "Tanzania,Tanzanian,,",
      "Ukraine,Ukrainian,,",
      "Uganda,Ugandan,,",
      "United States Minor Outlying Islands,,,",
      "United States of America,American,,",
      "Uruguay,Uruguayan,,",
      "Uzbekistan,Uzbekistani,,",
      "Vatican,,,",
      "Saint Vincent and Grenadines,Saint Vincentian,Vincentian,",
      "Venezuela,Venezuelan,,",
      "British Virgin Islands,Virgin Islander,,",
      "United States Virgin Islands,Virgin Islander,,",
      "Vietnam,Vietnamese,,",
      "Vanuatu,Ni-Vanuatu,,",
      "Wallis and Futuna Islands,Wallisian,Futunan,",
      "Samoa,Samoan,,",
      "Yemen,Yemeni,Yemenese,",
      "Mayotte,Mahoran,,",
      "South Africa,South African,,",
      "Zambia,Zambian,,",
      "Zimbabwe,Zimbabwean,,"]
  end
end