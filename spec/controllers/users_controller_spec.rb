require 'spec_helper'

describe UsersController do

  let(:valid_attributes) { attributes_for(:user) }
  let(:user) { create(:user) } 
  let(:valid_session) { {} }

  describe "User" do
    describe "GET index" do
      it "assigns all users as @users" do
        get :index, {}, valid_session
        expect(assigns(:users)).to eq([user])
      end
    end

    describe "GET show" do
      it "assigns the requested user as @user" do
        get :show, {:id => user.to_param}, valid_session
        expect(assigns(:user)).to eq(user)
      end
    end

    describe "GET edit" do
      it "assigns the requested user as @user" do
        get :edit, {:id => user.to_param}, valid_session
        expect(assigns(:user)).to eq(user)
      end
    end


    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested user" do
          User.any_instance.should_receive(:update).with({ "email" => "123@yahoo.es" })
          put :update, {
            :id => user.to_param, 
            :user => { "email" => "123@yahoo.es" }
            }, valid_session
        end

        it "assigns the requested user as @user" do
          put :update, {
            :id => user.to_param, 
            :user => valid_attributes
            }, valid_session
          expect(assigns(:user)).to eq(user)
        end

        it "redirects to the user profile" do
          put :update, {
            :id => user.to_param, 
            :user => valid_attributes
            }, valid_session
          expect(response).to redirect_to(user)
        end
      end

      describe "with invalid params" do
        it "assigns the user as @user" do
          User.any_instance.stub(:save).and_return(false)
          put :update, {
            :id => user.to_param, 
            :user => { "email" => "1" }
            }, valid_session
          assigns(:user).should eq(user)
        end

        it "re-renders the 'edit' template" do
          User.any_instance.stub(:save).and_return(false)
          put :update, {
            :id => user.to_param, 
            :user => { "email" => "1" }
            }, valid_session
          expect(response).to render_template("edit")
        end
      end
    end
  end
end