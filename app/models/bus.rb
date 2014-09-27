class Bus < ActiveRecord::Base
  validates :name, :bid, presence: true

  belongs_to :route
end
