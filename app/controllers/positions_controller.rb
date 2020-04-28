class PositionsController < ApplicationController
  before_action :set_position, only: [:show]
  before_action :authenticate_user!

  def show
    @players = @position.players
  end

  # POST /positions
  def create
    @position = Position.new(position_params)
    respond_to do |format|
      if @position.save
        format.html { redirect_to @position.player, notice: 'Position was successfully added.' }
      else
        format.html { redirect_to @position.player, alert: 'Something wrong happened.' }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_position
    @position = Position.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def position_params
    params.require(:position).permit()
  end
end