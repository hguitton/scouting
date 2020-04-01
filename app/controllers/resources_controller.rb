class ResourcesController < ApplicationController
  before_action :force_json

  def agents
    agents_us = Player.where.not(agent_us: ['', nil]).pluck(:agent_us).uniq
    agents_fr = Player.where.not(agent_fr: ['', nil]).pluck(:agent_fr).uniq
    render json: (agents_fr + agents_us)
  end

  def countries
    render json: countries_list
  end
  
  def leagues
    render json: leagues_list
  end

  def teams
    teams = []
    10.times do
      teams << Faker::Sports::Basketball.team
    end
    render json: teams.uniq
  end

  private
  def force_json
    request.format = :json
  end

  def leagues_list
    [ "Adriatic League Liga ABA",
      "Balkan BIBL",
      "Baltic Basketball League",
      "Baltic League BBL Challenge Cup",
      "Baltic League BBL Elite Division",
      "Basketball Champions League Europe",
      "Eurochallenge",
      "Eurocup",
      "Euroleague",
      "FIBA Europe Cup",
      "Liga Americas",
      "Liga Sudamericana",
      "VTB United League",
      "VTB Youth United League",
      "Austrian A Bundesliga",
      "Belarusian BPL",
      "Belgium-Scooore League",
      "Bosnian BiH Liga",
      "British BBL",
      "Bulgarian NBL",
      "Croatian A-1 Liga",
      "Cypriot Division A",
      "Czech NBL",
      "Danish Basketligaen",
      "Estonian KML",
      "Estonian-Latvian Basketball League",
      "Finnish Korisliiga",
      "French Jeep Elite",
      "French LNB Espoirs",
      "French LNB Pro B",
      "French NM1",
      "Georgian Super Liga",
      "German BBL",
      "German Pro A",
      "German Pro B",
      "Greek HEBA A1",
      "Greek HEBA A2",
      "Hungarian NBIA",
      "Icelandic Dominos League",
      "Irish Superleague",
      "Israeli BSL",
      "Italian Lega Basket Serie A",
      "Italian Serie A2 Basket",
      "Kazakhstani National League",
      "Kosovo FBK",
      "Latvian LBL",
      "Lithuanian LKL",
      "Lithuanian NKL",
      "Luxembourg Total League",
      "Macedonian Superleague",
      "Montenegrin Prva A Liga",
      "Netherlands DBL",
      "Norwegian BLNO",
      "Polish TBL",
      "Portuguese LPB",
      "Romanian Divizia A",
      "Russian PBL",
      "Serbian KLS",
      "Slovakian Extraliga",
      "Slovenian SKL",
      "Spanish ACB",
      "Spanish LEB Gold",
      "Spanish LEB Silver",
      "Swedish Basketligan",
      "Swiss LNA",
      "Turkish BSL",
      "Turkish TBL",
      "Ukrainian SL Favorit Sport",
      "Ukrainian Superleague",
      "African Basketball League",
      "Argentinian Liga A",
      "Australian NBL",
      "Basketball Africa League",
      "Basketball Africa League - Qualification",
      "Basketball Champions League Americas",
      "Brazilian NBB",
      "Canadian Elite Basketball League",
      "Canadian NBL",
      "Central Basketball League",
      "Chinese CBA",
      "Filipino PBA",
      "IBA-PBL",
      "International Basketball League",
      "Iran Superleague",
      "Japanese B.League",
      "Japanese JBL",
      "Lebanese Division A",
      "Mexican CIBACOPA",
      "Mexican LNBP",
      "National Basketball League of Japan",
      "New Zealand NBL",
      "PBA - Commissioners Cup",
      "PBA - Governors Cup",
      "PBA - Philippine Cup",
      "Premier Basketball League",
      "Puerto Rican BSN",
      "South Korean KBL",
      "Venezuelan LPB" ]
  end

  def countries_list
    [ "Afghanistan",
      "Afrique du Sud",
      "Albanie",
      "Algérie",
      "Allemagne",
      "Andorre",
      "Angola",
      "Arabie saoudite",
      "Argentine",
      "Arménie",
      "Australie",
      "Autriche",
      "Azerbaïdjan",
      "Bahamas",
      "Barbade",
      "Bélarus",
      "Belgique",
      "Belize",
      "Bénin",
      "Bermudes",
      "Bhoutan",
      "Bolivie",
      "Bosnie-Herzégovine",
      "Botswana",
      "Brésil",
      "Bulgarie",
      "Burkina Faso",
      "Burundi",
      "Cambodge",
      "Cameroun",
      "Canada",
      "Cap-Vert",
      "Chili",
      "Chine",
      "Chypre",
      "Colombie",
      "Comores",
      "Corée du Nord",
      "Corée du Sud",
      "Costa Rica",
      "Côte d’Ivoire",
      "Croatie",
      "Cuba",
      "Danemark",
      "Djibouti",
      "Dominique",
      "Égypte",
      "El Salvador",
      "Émirats arabes unis",
      "Équateur",
      "Érythrée",
      "Espagne",
      "Estonie",
      "États-Unis - USA",
      "Éthiopie",
      "Fidji",
      "Finlande",
      "France",
      "Gabon",
      "Gambie",
      "Géorgie",
      "Ghana",
      "Gibraltar",
      "Grèce",
      "Grenade",
      "Groenland",
      "Guadeloupe",
      "Guam",
      "Guatemala",
      "Guernesey",
      "Guinée",
      "Guinée équat.",
      "Guyana",
      "Guyane française",
      "Haïti",
      "Honduras",
      "Hongrie",
      "Îles Canaries",
      "Îles Cook",
      "Îles Féroé",
      "Inde",
      "Indonésie",
      "Irak",
      "Iran",
      "Irlande",
      "Islande",
      "Israël",
      "Italie",
      "Jamaïque",
      "Japon",
      "Jordanie",
      "Kazakhstan",
      "Kenya",
      "Koweït",
      "Laos",
      "Lettonie",
      "Liban",
      "Libéria",
      "Libye",
      "Liechtenstein",
      "Lituanie",
      "Luxembourg",
      "Macédoine",
      "Madagascar",
      "Malaisie",
      "Malawi",
      "Maldives",
      "Mali",
      "Malte",
      "Maroc",
      "Martinique",
      "Maurice",
      "Mauritanie",
      "Mayotte",
      "Mexique",
      "Moldavie",
      "Monaco",
      "Mongolie",
      "Monténégro",
      "Montserrat",
      "Mozambique",
      "Myanmar",
      "Namibie",
      "Nauru",
      "Népal",
      "Nicaragua",
      "Niger",
      "Nigéria",
      "Niue",
      "Norvège",
      "Nouvelle-Calédonie",
      "Nouvelle-Zélande",
      "Oman",
      "Ouganda",
      "Ouzbékistan",
      "Pakistan",
      "Palaos",
      "Panama",
      "Paraguay",
      "Pays-Bas",
      "Pérou",
      "Philippines",
      "Pitcairn",
      "Pologne",
      "Polynésie française",
      "Porto Rico",
      "Portugal",
      "Qatar",
      "Hong Kong",
      "Rép. centrafricaine",
      "Rép. démo. du Congo",
      "Rép. dominicaine",
      "Rép. tchèque",
      "Réunion",
      "Roumanie",
      "Royaume-Uni",
      "Russie",
      "Rwanda",
      "Sahara occidental",
      "Samoa",
      "Sénégal",
      "Serbie",
      "Serbie-et-Monténégro",
      "Seychelles",
      "Sierra Leone",
      "Singapour",
      "Slovaquie",
      "Slovénie",
      "Somalie",
      "Soudan",
      "Sri Lanka",
      "Suède",
      "Suisse",
      "Suriname",
      "Swaziland",
      "Syrie",
      "Tadjikistan",
      "Taïwan",
      "Tanzanie",
      "Tchad",
      "Thaïlande",
      "Timor oriental",
      "Togo",
      "Tokelau",
      "Tonga",
      "Trinité-et-Tobago",
      "Tristan da Cunha",
      "Tunisie",
      "Turkménistan",
      "Turquie",
      "Tuvalu",
      "Ukraine",
      "Union européenne",
      "Uruguay",
      "Vanuatu",
      "Venezuela",
      "Viêt Nam",
      "Yémen",
      "Zambie",
      "Zimbabwe"]
  end
end
