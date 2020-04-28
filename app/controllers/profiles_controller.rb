class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]
  before_action :authenticate_user!

  def show
    @players = @profile.players
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile.player, notice: 'Profile was successfully added.' }
      else
        format.html { redirect_to @profile.player, alert: 'Something wrong happened.' }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit()
  end
end
