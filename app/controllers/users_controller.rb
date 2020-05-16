class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  
  def favorites
    @players = @user.favorite_players
  end

  def add_fav_player
    if @user == current_user
      player = Player.find(params[:player_id])
      @user.favorite_players << player if player
    end
  end
  
  def remove_fav_player
    if @user == current_user
      player = Player.find(params[:player_id])
      @user.favorite_players
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end
