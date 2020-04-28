class SeasonsController < ApplicationController
  before_action :authenticate_user!

  # POST /seasons
  def create
    @season = Season.new(season_params)
    respond_to do |format|
      if @season.save
        format.html { redirect_to @season.player, notice: 'Season was successfully added.' }
      else
        format.html { redirect_to @season.player, alert: 'Something wrong happened.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.find(params[:id]).decorate
    end

    # Only allow a list of trusted parameters through.
    def season_params
      params.require(:season).permit(:id, :user_id, :name, :country, :team, :min, :points, :fgp, :three_fgp, :orb, :drb, :trb, :ast, :blk, :stl)
    end
end
