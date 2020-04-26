class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /players
  def index
    @players = Player.all.includes(:comments)
    @player = Player.new
    respond_to do |format|
      format.html { render :index }
      format.json
    end
  end

  # GET /players/1
  def show
    @comment = Comment.new
    @season = Season.new
  end

  # GET /players/new
  def new
    @player = Player.new
    @player.seasons.build
    @player.comments.build
    @player.socials.build
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  def create
    @player = Player.new(player_params)
    @player.updated_by_user_id = current_user.id
    respond_to do |format|
      if @player.save
        format.html { redirect_to players_path, notice: 'Player was successfully created.' }
      else
        format.html { 
            flash[:alert] = @player.errors.full_messages.join(", ")
            render :new
          }
      end
    end
  end

  # PATCH/PUT /players/1
  def update
    respond_to do |format|
      @player.updated_by_user_id = current_user.id
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
      else
        format.html { 
          flash[:alert] = @player.errors.full_messages.join(", ")
          render :edit 
        }
      end
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id]).decorate
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(
        :links,
        :name,
        :birthdate,
        :nationality,
        :level_id,
        :height_eu,
        :height_us,
        :weight_eu,
        :weight_us,
        :available,
        :agent_us,
        :agent_fr,
        :salary_estimation,
        :salary_real,
        :program,
        :status_id, 
        :position_id, 
        :updated_by_user_id, 
        :priority_id,
        profile_ids: [],
        seasons_attributes: [:id, :user_id, :name, :country, :team, :points, :trb, :ast, :min, :fgp, :three_fgp, :orb, :drb, :blk, :stl, :_destroy],
        comments_attributes: [:id, :user_id, :content],
        socials_attributes: [:id, :link, :_destroy]
      )
    end
end
