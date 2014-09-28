require 'rails_helper'

RSpec.describe Api::V1::StopsController, :type => :controller do
  describe "Get stops" do

    it "List stops" do
      stop=FactoryGirl.create(:stop)
      get :index, {:longitude => stop.longitude, :latitude => stop.latitude}
      expect(response.status).to eq 200
    end
  end
  
  
end
