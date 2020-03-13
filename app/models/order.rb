class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  
  after_create :purchased_send
  after_create :sold_send
  
  def purchased_send
    # Send an email to the user who bought the article
    UserMailer.purchased_email(self).deliver_now
  end
  
  def sold_send
    # Send an email to the user who did create the article
    UserMailer.sold_email(self).deliver_now
  end
end
