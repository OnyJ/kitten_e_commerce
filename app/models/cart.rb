class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items

  def total_price
    total_price = 0
    line_items.each do |line_item|
      total_price += line_item.item.price * line_item.quantity
    end
    total_price
  end
end
