class Route < ActiveRecord::Base
  validates :name, presence: true

  has_many :stops
  has_many :buses
end
