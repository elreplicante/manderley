class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit]
  def index
    @movie = Movie.find(params[:movie_id])
    @comments = @movie.comments
  end
  
  def show
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.build
  end

  def edit
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
          format.html { redirect_to @movie, notice: 'Comment was successfully created.' }
          format.json { render action: 'show', status: :created, location: @comment }
        else
          format.html { render action: 'new' }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :author)
  end
end
