require 'spec_helper'

describe MoviesController do

  let(:valid_movie_attributes) { FactoryGirl.attributes_for(:movie) }
  let(:valid_cast_attributes) { FactoryGirl.attributes_for(:cast) }
  let(:movie) { FactoryGirl.create(:movie) } 
  let(:cast) { FactoryGirl.create(:cast, movie: movie) } 
  let(:valid_session) { {} }

  describe "Movie" do
    describe "GET index" do
      it "assigns all movies as @movies" do
        get :index, {}, valid_session
        expect(assigns(:movies)).to eq([movie])
      end
    end

    describe "GET show" do
      it "assigns the requested movie as @movie" do
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
        get :edit, {:id => movie.to_param}, valid_session
        expect(assigns(:movie)).to eq(movie)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Movie" do
          expect {
            post :create, {:movie => valid_movie_attributes, :cast => valid_cast_attributes}, valid_session
          }.to change(Movie, :count).by(1)
        end

        it "assigns a newly created movie as @movie" do
          post :create, {:movie => valid_movie_attributes, :cast => valid_cast_attributes}, valid_session
          expect(assigns(:movie)).to be_a(Movie)
          expect(assigns(:movie)).to be_persisted
        end

        it "redirects to the created movie" do
          post :create, {:movie => valid_movie_attributes, :cast => valid_cast_attributes}, valid_session
          expect(response).to redirect_to(Movie.last)
        end
      end

      describe "with invalid params" do
        before(:each) do
          Movie.any_instance.stub(:save).and_return(false)
        end
        it "assigns a newly created but unsaved movie as @movie" do
          post :create, {:movie => { "title" => "invalid value" }, :cast => valid_cast_attributes}, valid_session
          expect(assigns(:movie)).to be_a_new(Movie)
        end

        it "re-renders the 'new' template" do
          post :create, {:movie => { "title" => "invalid value" }, :cast => valid_cast_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested movie" do
          Movie.any_instance.should_receive(:update).with({ "title" => "MyString" })
          put :update, {
            :id => movie.to_param, 
            :movie => { "title" => "MyString" }
            }, valid_session
        end

        it "assigns the requested movie as @movie" do
          put :update, {
            :id => movie.to_param, 
            :movie => valid_movie_attributes
            }, valid_session
          expect(assigns(:movie)).to eq(movie)
        end

        it "redirects to the movie" do
          put :update, {
            :id => movie.to_param, 
            :movie => valid_movie_attributes
            }, valid_session
          expect(response).to redirect_to(movie)
        end
      end

      describe "with invalid params" do
        it "assigns the movie as @movie" do
          Movie.any_instance.stub(:save).and_return(false)
          put :update, {
            :id => movie.to_param, 
            :movie => { "title" => "invalid value" }
            }, valid_session
          assigns(:movie).should eq(movie)
        end

        it "re-renders the 'edit' template" do
          Movie.any_instance.stub(:save).and_return(false)
          put :update, {
            :id => movie.to_param, 
            :movie => { "title" => "invalid value" }
            }, valid_session
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
        delete :destroy, {:id => movie.to_param}, valid_session
        expect(response).to redirect_to(movies_url)
      end
    end
  end

  describe "Casts" do
    describe "GET new" do
    it "assigns a new cast as @cast" do
      get :new_cast, {
        :movie_id => movie.to_param, 
            :cast => valid_cast_attributes
        }, valid_session
      expect(assigns(:cast)).to be_a_new(Cast)
    end
  end

    describe "POST create" do
      describe "with valid parameters" do
        it "creates a new Cast" do
          expect {
           post :create_cast, {
            :movie_id => movie.to_param, 
            :cast => valid_cast_attributes
            }, valid_session  
          }.to change(movie.casts, :count).by(1)
        end

        it "assigns a newly created cast as @cast" do
          post :create_cast, {
            :movie_id => movie.to_param, 
            :cast => valid_cast_attributes
            }, valid_session
          expect(assigns(:cast)).to be_a(Cast)
          expect(assigns(:cast)).to be_persisted
        end

        it "redirects to the cast's movie" do
          post :create_cast, {
          :movie_id => movie.to_param,
          :cast => valid_cast_attributes
          }, valid_session
          expect(response).to redirect_to(movie)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved cast as @cast" do
          Cast.any_instance.stub(:save).and_return(false)
          post :create_cast, {
            :movie_id => movie.to_param,
            :cast => { "role" => "invalid value" }
            }, valid_session
          expect(assigns(:cast)).to be_a_new(Cast)
        end

        it "re-renders new action" do
          Cast.any_instance.stub(:save).and_return(false)
          post :create_cast, {
            :movie_id => movie.to_param, 
            :cast => { "role" => "invalid value" }
            }, valid_session
          expect(response).to render_template("new")
        end
      end
    end
  end
end
