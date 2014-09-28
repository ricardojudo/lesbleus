require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe BusesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Bus. As you add validations to Bus, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    #skip("Add a hash of attributes valid for your model")
    FactoryGirl.attributes_for(:bus)
  }

  let(:invalid_attributes) {
#    skip("Add a hash of attributes invalid for your model")
      FactoryGirl.attributes_for(:invalid_bus)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BusesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all buses as @buses" do
      bus = Bus.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:buses)).to eq([bus])
    end
  end

  describe "GET show" do
    it "assigns the requested bus as @bus" do
      bus = Bus.create! valid_attributes
      get :show, {:id => bus.to_param}, valid_session
      expect(assigns(:bus)).to eq(bus)
    end
  end

  describe "GET new" do
    it "assigns a new bus as @bus" do
      get :new, {}, valid_session
      expect(assigns(:bus)).to be_a_new(Bus)
    end
  end

  describe "GET edit" do
    it "assigns the requested bus as @bus" do
      bus = Bus.create! valid_attributes
      get :edit, {:id => bus.to_param}, valid_session
      expect(assigns(:bus)).to eq(bus)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Bus" do
        expect {
          post :create, {:bus => valid_attributes}, valid_session
        }.to change(Bus, :count).by(1)
      end

      it "assigns a newly created bus as @bus" do
        post :create, {:bus => valid_attributes}, valid_session
        expect(assigns(:bus)).to be_a(Bus)
        expect(assigns(:bus)).to be_persisted
      end

      it "redirects to the created bus" do
        post :create, {:bus => valid_attributes}, valid_session
        expect(response).to redirect_to(Bus.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bus as @bus" do
        post :create, {:bus => invalid_attributes}, valid_session
        expect(assigns(:bus)).to be_a_new(Bus)
      end

      it "re-renders the 'new' template" do
        post :create, {:bus => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:bus, :name => Faker::Name.name)
      }

      it "updates the requested bus" do
        bus = Bus.create! valid_attributes
        put :update, {:id => bus.to_param, :bus => new_attributes}, valid_session
        bus.reload
        #skip("Add assertions for updated state")
      end

      it "assigns the requested bus as @bus" do
        bus = Bus.create! valid_attributes
        put :update, {:id => bus.to_param, :bus => valid_attributes}, valid_session
        expect(assigns(:bus)).to eq(bus)
      end

      it "redirects to the bus" do
        bus = Bus.create! valid_attributes
        put :update, {:id => bus.to_param, :bus => valid_attributes}, valid_session
        expect(response).to redirect_to(bus)
      end
    end

    describe "with invalid params" do
      it "assigns the bus as @bus" do
        bus = Bus.create! valid_attributes
        put :update, {:id => bus.to_param, :bus => invalid_attributes}, valid_session
        expect(assigns(:bus)).to eq(bus)
      end

      it "re-renders the 'edit' template" do
        bus = Bus.create! valid_attributes
        put :update, {:id => bus.to_param, :bus => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested bus" do
      bus = Bus.create! valid_attributes
      expect {
        delete :destroy, {:id => bus.to_param}, valid_session
      }.to change(Bus, :count).by(-1)
    end

    it "redirects to the buses list" do
      bus = Bus.create! valid_attributes
      delete :destroy, {:id => bus.to_param}, valid_session
      expect(response).to redirect_to(buses_url)
    end
  end

end
