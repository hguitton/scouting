class ApplicationController < ActionController::Base
  before_action :set_menu

  def set_menu
    @menu_statuses = Status.all
    @menu_profiles = Profile.all
    @menu_positions = Position.all
  end
end
