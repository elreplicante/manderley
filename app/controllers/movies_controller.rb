class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :create_cast]
  before_action :check_user, only: [:edit, :destroy]

  def index
    @movies = Movie.all
  end

  def show
    @comments = @movie.comments
    @comment = @movie.comments.build
    @cast = Cast.new
    @casts = Cast.all
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    @cast = Cast.new
    @movie.user = current_user
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end


  def new_cast
    @cast = Cast.new
  end
  
  def create_cast
    @cast = @movie.casts.build(cast_params)
    respond_to do |format|
      if @cast.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie }
      else
        format.html { render action: :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_movie
    @movie = Movie.friendly.find(params[:movie_id] || params[:id])
  end

  def movie_params
    params.require(:movie).permit(
      :title, 
      :duration, 
      :synopsis, 
      :year, 
      {categories: []},
      :user_id, 
      casts_attributes: [:id, :person_id, :role, :_destroy])
  end

  def cast_params
    params.require(:cast).permit(:person_id, :role)
  end

  def check_user
    render :show unless current_user == @movie.user
  end
end
