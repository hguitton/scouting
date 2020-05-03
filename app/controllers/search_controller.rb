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
    params.require(:search).permit(:min_height, :max_height, :min_weight, :max_weight, :min_age, :max_age, :available, :min_salary, :max_salary, positions: [], profiles: [], statuses: [])
  end
end