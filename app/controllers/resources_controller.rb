class ResourcesController < ApplicationController
  before_action :force_json
  include ApplicationHelper

  def agents
    agents_us = Player.where.not(agent_us: ['', nil]).pluck(:agent_us).uniq
    agents_fr = Player.where.not(agent_fr: ['', nil]).pluck(:agent_fr).uniq
    render json: (agents_fr + agents_us)
  end

  def countries
    render json: countries_list.map { |h| h["name"] }
  end
  
  def leagues
    custom_leagues = Season.all.pluck(:country).uniq
    render json: (leagues_list + custom_leagues).uniq
  end

  def teams
    custom_teams = Season.all.pluck(:team).uniq
    render json: custom_teams.uniq
  end

  def player_informations
    @player = PlayerInfos.new(params[:url])
    render json: @player
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
end
