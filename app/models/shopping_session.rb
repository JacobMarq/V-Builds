class ShoppingSession < ApplicationRecord
  belongs_to :user
  has_many :cart_items

  validates :total_cents, presence: true,
              numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
