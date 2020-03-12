class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  
  after_create :purchased_send
  after_create :sold_send
  
  def purchased_send
    # Send an email to the user who bought the article
  # UserMailer.purchased_email(current_user).deliver_now
    UserMailer.purchased_email(User.find(1)).deliver_now
  end
  
  def sold_send
    # Send an email to the user who did create the article
    User.all.each do |user|
      if user.profile.is_admin == true
        UserMailer.sold_email(user).deliver_now
      end
    end
  end
end
