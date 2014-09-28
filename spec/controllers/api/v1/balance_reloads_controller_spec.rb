require 'rails_helper'

RSpec.describe Api::V1::BalanceReloadsController, :type => :controller do

  describe 'Reload balance' do
    it 'Balance reloaded' do
      user=FactoryGirl.create(:user)
      sign_in user
      post :create, {:balance_reload =>FactoryGirl.attributes_for(:balance_reload, :amount => 500),
        :token=>user.id},
        {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}
      expect(response.status).to eq 204
      
      br=BalanceReload.first
      expect(br.amount).to eq 500
      
    end
  end

end
