require 'rails_helper'

RSpec.describe BalanceReload, :type => :model do
  describe 'factories' do  it 'has a valid factory' do
      expect(FactoryGirl.build(:balance_reload)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_balance_reload)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:balance_reload) }
    it { should respond_to :amount }
    it { should respond_to :pay_pal_tx }
  end
end
