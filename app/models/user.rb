class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :orders, dependent: :destroy

  after_create :set_cart
  after_create :set_profile
  after_create :welcome_send
  
  def set_cart
    Cart.create(user: self)
  end

  def set_profile
    Profile.create(user: self)
  end
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end