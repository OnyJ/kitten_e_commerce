class Item < ApplicationRecord
    validates :title, presence: true, length: { in: 4..140 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, presence: true

    has_many :line_items, dependent: :destroy
    has_many :carts, through: :line_items
end
