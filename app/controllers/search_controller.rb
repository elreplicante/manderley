class SearchController < ApplicationController
  
  def new
    @search = Search.new
  end

  def create
    @search = Search.new(params[:search])
    if @search.results.empty?
      render :new
    else
      render :show
    end
  end

  def show
  end

  private
  def search_params
    params.require(:search).permit(:keyword)
  end
end

