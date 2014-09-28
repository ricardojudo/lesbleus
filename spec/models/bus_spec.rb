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
  
  describe 'passengers' do
    it{
      bus=FactoryGirl.create(:bus);
      bus.increase_passengers
      expect(bus.passengers).to be_equal 1
      bus.increase_passengers
      expect(bus.passengers).to be_equal 2
    }
    it{
      bus=FactoryGirl.create(:bus);
      bus.increase_passengers
      expect(bus.passengers).to be_equal 1
      bus.increase_passengers
      expect(bus.passengers).to be_equal 2
      bus.increase_passengers
      expect(bus.passengers).to be_equal 3
      bus.decrease_passengers
      expect(bus.passengers).to be_equal 2
      
    }
  end
end
