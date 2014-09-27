class Stop < ActiveRecord::Base

  validates :name, :latitude, :longitude,  presence: true
  
  belongs_to :route
  
end
