class SearchController < ApplicationController
  before_action :set_search, only: [:show, :update]
  before_action :authenticate_user!

  def index
  end
  
  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params) 
    if @search.save
      redirect_to @search
    end
  end

  def show
    @players = @search.find_players
    respond_to do |format|
      format.html
      format.json { render 'players/index'}
    end
  end

  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
      else
        format.html { }
      end
    end
  end

  private

  def set_search
    @search = Search.find(params[:id])
  end

  def search_params
    params.require(:search).permit(
      :min_height, 
      :max_height, 
      :min_weight, 
      :max_weight, 
      :min_age, 
      :max_age, 
      :min_salary, 
      :max_salary, 
      available: [], 
      positions: [], 
      profiles: [], 
      statuses: [],
      priorities: []
    )
  end
end