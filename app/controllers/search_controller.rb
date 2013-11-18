class SearchController < ApplicationController
  before_filter :find_model

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(params)
    if !@search.results.empty?
      render :show
    else
      redirect_to :back
    end
    
  end

  def show
   
  end

  private
  def find_model
    @model = Search.find(params[:id]) if params[:id]
  end
end

