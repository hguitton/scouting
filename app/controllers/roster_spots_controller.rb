class RosterSpotsController < ApplicationController
  before_action :set_roster_spot, only: [:update, :destroy]
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
      redirect_to @roster_spot, notice: 'Roster was successfully updated.'
    else
      flash[:alert] = @roster_spot.errors.full_messages.join(", ")
      render :edit 
    end
  end

  def destroy
    @roster_spot.destroy
    redirect_to rosters_url, notice: 'Roster was successfully destroyed.'
  end

  private
    def set_roster_spot
      @roster_spot = RosterSpot.find(params[:id]).decorate
    end

    def roster_spot_params
      params.require(:roster_spot).permit(:name, :minutes, :position_id, :price)
    end
end
