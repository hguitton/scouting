class ApplicationController < ActionController::Base
  before_action :set_menu
  before_action :set_rosters
  
  def current_user
    @current_user ||= super && User.includes(:favorite_players).find(@current_user.id)
  end

  def set_menu
    @menu_statuses = Status.all
    @menu_profiles = Profile.all
    @menu_positions = Position.order(order: :asc).all
  end
  
  def set_rosters
    @rosters = Roster.all
  end
end
