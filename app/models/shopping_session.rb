class ShoppingSession < ApplicationRecord
  belongs_to :user

  validates :total, presence: true, 
            numericality: { greater_than_or_equal_to: 0, 
                            less_than: BigDecimal(10**10) },
            format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
end
