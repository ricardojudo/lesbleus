class BalanceReload < ActiveRecord::Base
  validates :amount, presence: true

  belongs_to :user
  
end
