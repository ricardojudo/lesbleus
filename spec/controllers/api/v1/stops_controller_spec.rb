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
      stop=FactoryGirl.create(:stop)
      bus=FactoryGirl.create(:bus, :stop => stop)
      
      get api_v1_stop_buses_path, stop
      expect(response.status).to eq 200
      buses=json(response.body)
      puts buses
    end
  end
end
