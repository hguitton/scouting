class RostersController < ApplicationController
  before_action :set_roster, only: [:show, :edit, :update, :destroy, :add_player, :remove_player]
  before_action :authenticate_user!
  
  def index
    @rosters = Roster.all
  end

  def show
    @spot = @roster.roster_spots.includes(:position).order("positions.order asc").first
  end

  def new
    @roster = Roster.new
  end

  def create
    @roster = Roster.new(roster_params)
    if @roster.save
      redirect_to rosters_path, notice: 'Roster was successfully created.'
    else
      flash[:alert] = @roster.errors.full_messages.join(", ")
      render :new
    end
  end

  def update
    if @roster.update(roster_params)
      redirect_to @roster, notice: 'Roster was successfully updated.'
    else
      flash[:alert] = @roster.errors.full_messages.join(", ")
      render :edit 
    end
  end

  def destroy
    @roster.destroy
    redirect_to rosters_url, notice: 'Roster was successfully destroyed.'
  end

  def get_spot
    
  end
  
  def add_player
    player = Player.find(params[:player_id])
    unless @roster.players.include?(player)
      @roster.players << player if player
      redirect_back(fallback_location: roster_path(@roster), notice: 'Player was successfully added to the Roster.')
    else
      redirect_back(fallback_location: roster_path(@roster), alert: 'Player is already in Roster.')
    end
  end
  
  def remove_player
    player = Player.find(params[:player_id])
    @roster.players.delete(player) if player
    redirect_to @roster
  end

  private
    def set_roster
      @roster = Roster.find(params[:id]).decorate
    end

    def roster_params
      params.require(:roster).permit(:name, :description)
    end
end
