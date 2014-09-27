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
end
