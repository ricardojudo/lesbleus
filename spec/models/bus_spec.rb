require 'rails_helper'

RSpec.describe Bus, :type => :model do
  describe 'factories' do  it 'has a valid factory' do
      expect(FactoryGirl.build(:bus)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_bus)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:bus) }
    it { should respond_to :name }
    it { should respond_to :bid }
    it { should respond_to :longitude}
    it { should respond_to :latitude}
  end
end
