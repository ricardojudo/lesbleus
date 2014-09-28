require 'rails_helper'

RSpec.describe TicketPayment, :type => :model do
  describe 'factories' do  it 'has a valid factory' do
      expect(FactoryGirl.build(:ticket_payment)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_ticket_payment)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:ticket_payment) }
    it { should respond_to :amount }
  end
end
