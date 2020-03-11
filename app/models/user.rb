class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart, dependent: :destroy

  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  after_create :set_cart
  def set_cart
    Cart.create(user: self)
  end
end
