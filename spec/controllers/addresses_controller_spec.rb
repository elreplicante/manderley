require 'spec_helper'

describe AddressesController do

  let(:address) { create(:address) } 
  let(:invalid_address) { create(:address, street: nil) } 
  let(:valid_attributes) { attributes_for(:address) } 
  let(:valid_session) { {} } 

  describe "GET index" do
    it "assigns all addresses as @addresses" do
      get :index, { }, valid_session
      expect(assigns(:addresses)).to eq ([address])
    end
  end

  describe "GET new" do
    it "assigns a new address to an @address" do
      get :new, { }, valid_session
      expect(assigns(:address)).to be_a_new(Address)
    end
  end

  describe "GET show" do
    it "assigns the requested address as @address" do
      get :show, {id: address.to_param}, valid_session
      expect(assigns(:address)).to eq(address)
    end
  end

  describe "GET edit" do
    it "assigns an address to an @address" do
      get :edit, { id: address.to_param}, valid_session
      expect(assigns(:address)).to eq(address)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new address" do
            expect {
              post :create, {:address => valid_attributes}, valid_session
            }.to change(Address, :count).by(1)
      end

      it "assigns a newly created address as @address" do
        post :create, {:address => valid_attributes }, valid_session
        expect(assigns(:address)).to be_a(Address)
        expect(assigns(:address)).to be_persisted
      end

      it "redirect to show action" do
        post :create, {:address => valid_attributes }, valid_session
        expect(response).to redirect_to(:show)
      end
    end

    context "with invalid attributes" do
      before(:each) do
          Address.any_instance.stub(:save).and_return(false)
        end

      it "renders new action" do
        post :create, {:address => { street: nil } }, valid_session
        expect(response).to render_template(:new)
      end

      it "assigns a newly created but unsaved address" do
        post :create, {:address => { street: nil } }, valid_session
        expect(assigns(:address)).to be_a_new(Address)
      end
    end
  end


  describe "PUT update" do
    context "with valid attributes" do
     it "updates the requested address" do 
      an_address = create(:address, valid_attributes)
      put :update, { :id => an_address.to_param, :address => {:street => "Atocha"} } , valid_session
    end

    it "assigns the requested address as @address" do
      put :update, { :id => address.to_param, :address => {:street => "Atocha"} }, valid_session 
      expect(assigns(:address)).to eq(address)
    end

    it "redirects to the address page" do
        put :update, {
          id: address.to_param, 
          :address => valid_attributes
          }, valid_session
        expect(response).to redirect_to(address)
      end
    end

    context "with invalid params" do
      it "assigns the address as @address" do
        an_address = create(:address, valid_attributes)
        put :update, {
          :id => address.to_param, 
          :address => { :street => "invalid value" }
          }, valid_session
        assigns(:address).should eq(address)
      end

      it "re-renders the 'edit' template" do
        an_address = create(:address, valid_attributes)
        put :update, {
          :id => address.to_param, 
          :address => { :street => "invalid value" }
          }, valid_session
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE destroy" do
      it "destroys the requested address" do
        address = create(:address)
        expect {
          delete :destroy, {:id => address.to_param}, valid_session
        }.to change(Address, :count).by(-1)
      end

      it "redirects to the address list" do
        delete :destroy, {:id => address.to_param}, valid_session
        expect(response).to redirect_to(addresses_path)
      end
    end
end
