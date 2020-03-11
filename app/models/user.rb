class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  after_create :welcome_send
  after_create :set_cart
  
  has_one :cart, dependent: :destroy

  def set_cart
    Cart.create(user: self)
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
