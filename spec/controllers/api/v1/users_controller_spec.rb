require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do

  describe "Payments" do

    it "Pay balance" do
      pending
      stop=FactoryGirl.create(:stop)
      get :index, {:longitude => stop.longitude, :latitude => stop.latitude}
      expect(response.status).to eq 200
    end
    
    #it "Pay ticket for the bus" do
     # pending 
      
    #end
    
  end 


end
