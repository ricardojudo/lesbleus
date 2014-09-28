require 'rails_helper'

RSpec.describe Api::V1::StopsController, :type => :controller do
  describe "Get stops" do

    it "List stops" do
      stop=FactoryGirl.create(:stop)
      get :index, {:longitude => stop.longitude, :latitude => stop.latitude}
      expect(response.status).to eq 200
    end
  end
  
  describe "Get buses" do
    it "Buses by stop" do
      route=FactoryGirl.create(:route)
      
      
      stop=FactoryGirl.create(:stop, :route => route)
      bus=FactoryGirl.create(:bus, :route => route )
      
      #pending
      #get api_v1_stop_buses_path, [:stop_id => stop.id]
      #expect(response.status).to eq 200
      #buses=json(response.body)
      #puts buses
    end
  end
end
