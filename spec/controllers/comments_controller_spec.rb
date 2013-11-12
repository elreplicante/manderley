require 'spec_helper'

describe CommentsController do
  let(:valid_attributes) { FactoryGirl.attributes_for(:comment) }
  let(:valid_session) { {} }

  describe "GET index" do
    it "lists all comments as @comments" do
      movie = FactoryGirl.create(:movie)
      comment = FactoryGirl.create(:comment, movie: movie)
      get :index, {:movie_id => movie.to_param}, valid_session
      expect(assigns(:comments)).to eq([comment])
    end
  end

  describe "GET show" do
    it "assigns the requested comment as @comment" do
      movie = FactoryGirl.create(:movie)
      comment = FactoryGirl.create(:comment, movie: movie)
      get :show, {:movie_id => movie.to_param, :id => comment.to_param}, valid_session
      expect(assigns(:comment)).to eq comment
    end
  end

  describe "GET new" do
    it "assigns a new comment as @comment" do
      movie = FactoryGirl.create(:movie)
      get :new, {:movie_id => movie.to_param}, valid_session
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe "GET edit" do
    it "asigns the requested comment as @comment" do
      movie = FactoryGirl.create(:movie)
      comment = FactoryGirl.create(:comment, movie: movie)
      get :edit, {:movie_id => movie.to_param, :id => comment.to_param}, valid_session
      expect(assigns(:comment)).to eq comment
    end
  end

  describe "POST create" do
    describe "with valid atributes" do
      it "creates a new comment" do
        movie = FactoryGirl.create(:movie)
        expect {
         post :create, {:movie_id => movie.to_param, :comment => valid_attributes}, valid_session  
        }.to change(movie.comments, :count).by(1)
      end
    end 
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      movie = FactoryGirl.create(:movie)
      comment = FactoryGirl.create(:comment, movie: movie)
      expect {
        delete :destroy, {:movie_id => movie.to_param, :id => comment.to_param}, valid_session
      }.to change(movie.comments, :count).by(-1)
    end

    it "redirects to the movies list" do
      movie = FactoryGirl.create(:movie)
      comment = FactoryGirl.create(:comment, movie: movie)
      delete :destroy, {:movie_id => movie.to_param, :id => comment.to_param}, valid_session
      expect(response).to redirect_to(movies_url)
    end
  end
end
