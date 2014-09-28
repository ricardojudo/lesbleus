require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'factories' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:user)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_user)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:user) }
    it { should respond_to :first_name }
    it { should respond_to :last_name }
    it { should respond_to :email }
  end
  
  describe 'payments' do
    it{
      user=FactoryGirl.build(:user)
      user.pay_balance 100.00
      expect(user.balance).to be_equal 100.00
    }
    
    it{
      user=FactoryGirl.build(:user)
      expect(user.enough_balance 5.00).to be_falsey
    }
    
    it{
      user=FactoryGirl.build(:user)
      user.pay_balance 100.00
      expect(user.enough_balance 5.00).to be_truthy
    }
    
    it {
      user=FactoryGirl.build(:user)
      user.pay_balance 100.00
      expect(user.balance).to be_equal 100.00
      user.pay_ticket 5.00
      expect(user.balance).to be_equal 95.00
    }
  end
end
