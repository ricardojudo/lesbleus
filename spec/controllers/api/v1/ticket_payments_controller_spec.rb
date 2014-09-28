require 'rails_helper'

RSpec.describe Api::V1::TicketPaymentsController, :type => :controller do
  describe 'Pay ticket' do
    it 'Payment successful' do
      user=FactoryGirl.create(:user, :balance=> 500)
      sign_in user
      post :create, {:ticket_payment =>FactoryGirl.attributes_for(:ticket_payment, :amount => 5.00)},
        {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}
      expect(response.status).to eq 200

      tp=TicketPayment.first
      expect(tp.amount).to eq 5.0
      
      puts response.body
    end
  end

  describe 'Pay ticket' do
    it 'Not enough money' do
      user=FactoryGirl.create(:user)
      sign_in user
      post :create, {:ticket_payment =>FactoryGirl.attributes_for(:ticket_payment, :amount => 5.00)},
        {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}
      expect(response.status).to eq 422

    end
  end

end
