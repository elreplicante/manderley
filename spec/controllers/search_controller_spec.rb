require 'spec_helper'

describe SearchController do
  let(:valid_search_attributes) { attributes_for(:search) }
  let(:search) { create(:search) }
  let(:valid_session) { {} }
  
  describe "Search" do
    describe "GET new" do
      it "assigns a new search as @search" do
        search = Search.new
        get :new, { }, valid_session
        expect(assigns(:search)).to be_a_new(Search)
      end
    end
  end

  describe "POST create" do
    describe "with valid parameters" do
      it "assigns a newly created search as @search" do
        post :create, { :search => valid_search_attributes }, valid_session
        expect(assigns(:search)).to be_a(Search)
      end

      xit "renders to results page" do
        post :create, { :search => valid_search_attributes }, valid_session
        expect(response).to render_template(:show)
      end
    end

    describe "with invalid params" do
      before(:each) do
        Search.any_instance.stub(:save).and_return(false)
      end
      it "assigns a newly created but unsaved movie as @movie" do
        post :create, {:search => { "keyword" => "invalid value" }}, valid_session
        expect(assigns(:search)).to be_a_new(Search)
      end

      it "re-renders the 'new' template" do
        post :create, {:search => { "keyword" => "invalid value" }}, valid_session
        expect(response).to render_template(:new)
      end
    end
  end
end