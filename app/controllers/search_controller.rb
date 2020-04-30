class SearchController < ApplicationController
  before_action :authenticate_user!

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params) 
    if @search.save
      redirect_to @search
    end
  end

  private
  def search_params
    params.require(:search).permit(:min_height, :max_height, :min_weight, :max_weight, :min_age, :max_age, :positions, :profiles, :statuses, :available, :min_salary, :max_salary)
  end
end