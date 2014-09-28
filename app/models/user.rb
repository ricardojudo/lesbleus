class User < ActiveRecord::Base
  #before_save :ensure_authentication_token

  validates :first_name, presence: true
  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :ticket_payments
  has_many :balance_reload       
  
  def skip_confirmation!
    self.confirmed_at = Time.now
  end
  
  def pay_balance(balance)
    self.balance = 0 if self.balance.nil?
    self.balance += balance
  end
  
  def pay_ticket(amount)
    self.balance -= amount
  end
  
  def enough_balance(amount)
    self.balance = 0 if self.balance.nil?
    self.balance - amount > 0
  end
  
  
end
