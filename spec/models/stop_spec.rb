require 'rails_helper'

RSpec.describe Stop, :type => :model do

  describe 'factories' do  it 'has a valid factory' do
      expect(FactoryGirl.build(:stop)).to be_valid
    end
    it 'has an invalid factory' do
      expect(FactoryGirl.build(:invalid_stop)).to_not be_valid
    end
  end
  describe 'attributes' do
    subject { FactoryGirl.build(:stop) }
    it { should respond_to :name }
    it { should respond_to :longitude }
    it { should respond_to :latitude }
  end
end
