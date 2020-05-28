class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  
  def favorites
    @players = @user.favorite_players.includes({ comments: :user}, :position, :status, :priority, :profiles, :seasons)
    respond_to do |format|
      format.html
      format.json { render 'players/players' }
    end
  end

  def add_fav_player
    if @user == current_user
      player = Player.find(params[:player_id])
      unless @user.favorite_players.include?(player)
        @user.favorite_players << player if player
      end
    end
  end
  
  def remove_fav_player
    if @user == current_user
      player = Player.find(params[:player_id])
      @user.favorite_players.delete(player) if player
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end
