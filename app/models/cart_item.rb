class CartItem < ApplicationRecord
  belongs_to :shopping_session
  belongs_to :build
  
  validates :shopping_session, presence: true
  validates :build, presence: true
  validates :quantity, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
