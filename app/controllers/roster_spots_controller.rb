class RosterSpotsController < ApplicationController
  before_action :set_roster_spot, only: [:update, :destroy, :update_players]
  before_action :authenticate_user!
  
  def create
    @roster = Roster.find(params[:roster_id])
    @roster_spot = @roster.roster_spots.new(roster_spot_params)

    if @roster_spot.save
      redirect_to roster_path(@roster), notice: 'Spot was successfully created.'
    else
      flash[:alert] = @roster_spot.errors.full_messages.join(", ")
      render :new
    end
  end

  def update
    if @roster_spot.update(roster_spot_params)
      redirect_to @roster_spot.roster, notice: 'RosterSpot was successfully updated.'
    else
      flash[:alert] = @roster_spot.errors.full_messages.join(", ")
      redirect_to @roster_spot.roster
    end
  end

  def update_players
    @roster_spot.player_spots.destroy_all
    params[:players].each_with_index do |player, index|
      @roster_spot.player_spots.create(player_id: player.to_i, order: index)
    end
    redirect_to @roster_spot.roster
  end

  def destroy
    @roster = @roster_spot.roster
    @roster_spot.destroy
    redirect_to @roster, notice: 'RosterSpot was successfully destroyed.'
  end

  private
    def set_roster_spot
      @roster_spot = RosterSpot.find(params[:id])
    end

    def roster_spot_params
      params.require(:roster_spot).permit(:name, :minutes, :position_id, :price)
    end
end
