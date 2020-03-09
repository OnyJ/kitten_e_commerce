class Item < ApplicationRecord
    validates :title, presence: true, length: { in: 4..140 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, presence: true
end
