require 'spec_helper'

describe CommentsController do
  let(:valid_attributes) { FactoryGirl.attributes_for(:comments) }
  let(:valid_session) { {} }

  describe "GET index" do
    it "lists all comments as @comments" do
      comment = FactoryGirl.create(:comment)
      get :index, {}, valid_session
      expect(assigns(:comments)).to eq([comment])
    end
  end
end
