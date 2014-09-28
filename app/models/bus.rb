class Bus < ActiveRecord::Base
  validates :name, :bid, presence: true

  belongs_to :route
  
  
  def increase_passengers
    self.passengers = 0 if self.passengers.nil?
    self.passengers += 1
  end
  
  def decrease_passengers
    self.passengers -=1 if self.passengers > 0
  end
end
