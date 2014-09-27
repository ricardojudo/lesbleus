class User < ActiveRecord::Base
  before_save :ensure_authentication_token

  validates :first_name, presence: true
  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
  def skip_confirmation!
    self.confirmed_at = Time.now
  end
end
