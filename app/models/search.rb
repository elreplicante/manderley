class Search
  attr_accessor :search_field

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def initialize(params = {})
    @keyword ||= params[:keyword]
  end

  def results
    @results ||= find_movies
  end

  def new_record?
    true
  end

  private
  def find_movies
    Movie.where(' title = "%?%"', @keyword)
  end
end