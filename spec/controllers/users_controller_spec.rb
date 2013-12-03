require 'spec_helper'

describe UsersController do

  let(:valid_attributes) { attributes_for(:users) }
  let(:user) { create(:user) } 
  let(:valid_session) { {} }

  describe "User" do
    describe "GET index" do
      it "assigns all users as @users" do
        get :index, {}, valid_session
        expect(assigns(:users)).to eq([user])
      end
    end
  end
end