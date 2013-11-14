require 'spec_helper'

describe MoviesController do

  let(:valid_attributes) { FactoryGirl.attributes_for(:movie) }
  let(:valid_session) { {} }

  describe "Movie" do
    describe "GET index" do
      it "assigns all movies as @movies" do
        movie = FactoryGirl.create(:movie)
        get :index, {}, valid_session
        expect(assigns(:movies)).to eq([movie])
      end
    end

    describe "GET show" do
      it "assigns the requested movie as @movie" do
        movie = FactoryGirl.create(:movie)
        get :show, {:id => movie.to_param}, valid_session
        expect(assigns(:movie)).to eq(movie)
      end
    end

    describe "GET new" do
      it "assigns a new movie as @movie" do
        get :new, {}, valid_session
        expect(assigns(:movie)).to be_a_new(Movie)
      end
    end

    describe "GET edit" do
      it "assigns the requested movie as @movie" do
        movie = FactoryGirl.create(:movie)
        get :edit, {:id => movie.to_param}, valid_session
        expect(assigns(:movie)).to eq(movie)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Movie" do
          expect {
            post :create, {:movie => valid_attributes}, valid_session
          }.to change(Movie, :count).by(1)
        end

        it "assigns a newly created movie as @movie" do
          post :create, {:movie => valid_attributes}, valid_session
          expect(assigns(:movie)).to be_a(Movie)
          expect(assigns(:movie)).to be_persisted
        end

        it "redirects to the created movie" do
          post :create, {:movie => valid_attributes}, valid_session
          expect(response).to redirect_to(Movie.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved movie as @movie" do
          Movie.any_instance.stub(:save).and_return(false)
          post :create, {:movie => { "title" => "invalid value" }}, valid_session
          expect(assigns(:movie)).to be_a_new(Movie)
        end

        it "re-renders the 'new' template" do
          Movie.any_instance.stub(:save).and_return(false)
          post :create, {:movie => { "title" => "invalid value" }}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested movie" do
          movie = FactoryGirl.create(:movie)
          Movie.any_instance.should_receive(:update).with({ "title" => "MyString" })
          put :update, {:id => movie.to_param, :movie => { "title" => "MyString" }}, valid_session
        end

        it "assigns the requested movie as @movie" do
          movie = FactoryGirl.create(:movie)
          put :update, {:id => movie.to_param, :movie => valid_attributes}, valid_session
          expect(assigns(:movie)).to eq(movie)
        end

        it "redirects to the movie" do
          movie = FactoryGirl.create(:movie)
          put :update, {:id => movie.to_param, :movie => valid_attributes}, valid_session
          expect(response).to redirect_to(movie)
        end
      end

      describe "with invalid params" do
        it "assigns the movie as @movie" do
          movie = FactoryGirl.create(:movie)
          Movie.any_instance.stub(:save).and_return(false)
          put :update, {:id => movie.to_param, :movie => { "title" => "invalid value" }}, valid_session
          assigns(:movie).should eq(movie)
        end

        it "re-renders the 'edit' template" do
          movie = FactoryGirl.create(:movie)
          Movie.any_instance.stub(:save).and_return(false)
          put :update, {:id => movie.to_param, :movie => { "title" => "invalid value" }}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested movie" do
        movie = FactoryGirl.create(:movie)
        expect {
          delete :destroy, {:id => movie.to_param}, valid_session
        }.to change(Movie, :count).by(-1)
      end

      it "redirects to the movies list" do
        movie = FactoryGirl.create(:movie)
        delete :destroy, {:id => movie.to_param}, valid_session
        expect(response).to redirect_to(movies_url)
      end
    end
  end

  describe "People" do
    
  end

end
