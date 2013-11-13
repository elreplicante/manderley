require 'spec_helper'

describe CommentsController do

  let(:valid_attributes) { FactoryGirl.attributes_for(:comment) }
  let(:valid_session) { {} }

  before(:each) do
    @movie = FactoryGirl.create(:movie)
  end

  describe "GET index" do
    it "lists all comments as @comments" do
      comment = FactoryGirl.create(:comment, movie: @movie)
      get :index, {:movie_id => @movie.to_param}, valid_session
      expect(assigns(:comments)).to eq([comment])
    end
  end

  describe "GET show" do
    it "assigns the requested comment as @comment" do
      comment = FactoryGirl.create(:comment, movie: @movie)
      get :show, {:movie_id => @movie.to_param, :id => comment.to_param}, valid_session
      expect(assigns(:comment)).to eq comment
    end
  end

  describe "GET new" do
    it "assigns a new comment as @comment" do
      get :new, {:movie_id => @movie.to_param}, valid_session
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe "GET edit" do
    it "asigns the requested comment as @comment" do
      comment = FactoryGirl.create(:comment, movie: @movie)
      get :edit, {:movie_id => @movie.to_param, :id => comment.to_param}, valid_session
      expect(assigns(:comment)).to eq comment
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
         post :create, {:movie_id => @movie.to_param, :comment => valid_attributes}, valid_session  
        }.to change(@movie.comments, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, {:movie_id => @movie.to_param, :comment => valid_attributes}, valid_session
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the comment's movie" do
        post :create, {:movie_id => @movie.to_param, :comment => valid_attributes}, valid_session
        expect(response).to redirect_to(@movie)
      end
    end 

    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {:movie_id => @movie.to_param,:comment => { "body" => "invalid value" }}, valid_session
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {:movie_id => @movie.to_param, :comment => { "body" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested comment" do
        comment = FactoryGirl.create(:comment, movie: @movie)
        Comment.any_instance.should_receive(:update).with({ "body" => "MyString" })
        put :update, {id: comment.to_param, :comment => { "body" => "MyString" }}, valid_session
      end

      it "assigns the requested comment as @comment" do
        comment = FactoryGirl.create(:comment, movie: @movie)
        put :update, {id: comment.to_param , :comment => valid_attributes}, valid_session
        expect(assigns(:comment)).to eq(comment)
      end

      it "redirects to the comment's movie" do
        comment = FactoryGirl.create(:comment, movie: @movie)
        put :update, {id: comment.to_param, :comment => valid_attributes}, valid_session
        expect(response).to redirect_to(@movie)
      end
    end

    describe "with invalid params" do
      it "assigns the comment as @comment" do
        comment = FactoryGirl.create(:comment, movie: @movie)
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {:id => comment.to_param, :comment => { "author" => "invalid value" }}, valid_session
        assigns(:comment).should eq(comment)
      end

      xit "re-renders the 'edit' template" do
        comment = FactoryGirl.create(:comment, movie: @movie)
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {:id => comment.to_param, :movie => { "author" => "invalid value" }}, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      comment = FactoryGirl.create(:comment, movie: @movie)
      expect {
        delete :destroy, {:movie_id => @movie.to_param, :id => comment.to_param}, valid_session
      }.to change(@movie.comments, :count).by(-1)
    end

    it "redirects to the movies list" do
      comment = FactoryGirl.create(:comment, movie: @movie)
      delete :destroy, {:movie_id => @movie.to_param, :id => comment.to_param}, valid_session
      expect(response).to redirect_to(movies_url)
    end
  end
end
