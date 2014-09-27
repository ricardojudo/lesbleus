require 'rails_helper'

RSpec.describe Route, :type => :model do
   describe 'factories' do  it 'has a valid factory' do
      expect(FactoryGirl.build(:route)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_route)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:route) }
    it { should respond_to :name }
  end
end
