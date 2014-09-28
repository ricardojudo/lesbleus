require 'rails_helper'

RSpec.describe Api::V1::BusesController, :type => :controller do

  describe "Update position" do

    it "Checkin" do
      bus=FactoryGirl.create(:bus)
      patch :update_position,
        {:bus =>FactoryGirl.attributes_for(:bus)},
        {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'Bleus-Action' => 'Check-In'}
      expect(response.status).to eq 200
    end

    it "Update position" do
    bus=FactoryGirl.create(:bus)
      patch :update_position,
        {:bus =>FactoryGirl.attributes_for(:bus)},
        {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}
      expect(response.status).to eq 200
    end

    it "Checkout" do
    bus=FactoryGirl.create(:bus)
      patch :update_position,
        {:bus =>FactoryGirl.attributes_for(:bus)},
        {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s, 'Bleus-Action' => 'Check-Out'} 
      expect(response.status).to eq 200
    end

  end

end
