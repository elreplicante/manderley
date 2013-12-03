require 'spec_helper'

describe PeopleController do

  let(:valid_attributes)  { attributes_for(:person) } 
  let(:person) { create(:person) } 
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all people as @people" do
      get :index, {}, valid_session
      expect(assigns(:people)).to eq([person])
    end
  end

  describe "GET show" do
    it "assigns the requested person as @person" do
      person = Person.create! valid_attributes
      get :show, {:id => person.to_param}, valid_session
      assigns(:person).should eq(person)
    end
  end

  describe "GET new" do
    it "assigns a new person as @person" do
      get :new, {}, valid_session
      assigns(:person).should be_a_new(Person)
    end
  end

  describe "GET edit" do
    it "assigns the requested person as @person" do
      person = Person.create! valid_attributes
      get :edit, {:id => person.to_param}, valid_session
      assigns(:person).should eq(person)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Person" do
        expect {
          post :create, {:person => valid_attributes}, valid_session
        }.to change(Person, :count).by(1)
      end

      it "assigns a newly created person as @person" do
        post :create, {:person => valid_attributes}, valid_session
        assigns(:person).should be_a(Person)
        assigns(:person).should be_persisted
      end

      it "redirects to the created person" do
        post :create, {:person => valid_attributes}, valid_session
        response.should redirect_to(Person.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved person as @person" do
        Person.any_instance.stub(:save).and_return(false)
        post :create, {:person => { "name" => "invalid value" }}, valid_session
        assigns(:person).should be_a_new(Person)
      end

      it "re-renders the 'new' template" do
        Person.any_instance.stub(:save).and_return(false)
        post :create, {:person => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested person" do
        person = Person.create! valid_attributes
        Person.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => person.to_param, :person => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested person as @person" do
        person = Person.create! valid_attributes
        put :update, {:id => person.to_param, :person => valid_attributes}, valid_session
        assigns(:person).should eq(person)
      end

      it "redirects to the person" do
        person = Person.create! valid_attributes
        put :update, {:id => person.to_param, :person => valid_attributes}, valid_session
        response.should redirect_to(person)
      end
    end

    describe "with invalid params" do
      it "assigns the person as @person" do
        person = Person.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Person.any_instance.stub(:save).and_return(false)
        put :update, {:id => person.to_param, :person => { "name" => "invalid value" }}, valid_session
        assigns(:person).should eq(person)
      end

      it "re-renders the 'edit' template" do
        person = Person.create! valid_attributes
        Person.any_instance.stub(:save).and_return(false)
        put :update, {:id => person.to_param, :person => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested person" do
      person = Person.create! valid_attributes
      expect {
        delete :destroy, {:id => person.to_param}, valid_session
      }.to change(Person, :count).by(-1)
    end

    it "redirects to the people list" do
      person = Person.create! valid_attributes
      delete :destroy, {:id => person.to_param}, valid_session
      response.should redirect_to(people_url)
    end
  end
end
