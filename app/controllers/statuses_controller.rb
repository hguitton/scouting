class StatusesController < ApplicationController
  before_action :set_status, only: [:show]
  before_action :authenticate_user!

  def show
    @players = @status.players
  end

  # POST /statuss
  def create
    @status = Status.new(status_params)
    respond_to do |format|
      if @status.save
        format.html { redirect_to @status.player, notice: 'Status was successfully added.' }
      else
        format.html { redirect_to @status.player, alert: 'Something wrong happened.' }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_status
    @status = Status.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def status_params
    params.require(:status).permit()
  end
end
