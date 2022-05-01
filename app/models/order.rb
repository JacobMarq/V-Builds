class Order < ApplicationRecord
  belongs_to :user
  belongs_to :payment_detail

  has_many :order_items
  has_many :builds, through: :order_items, source: :build

  validates :users, presence: true
  validates :total, presence: true, 
            numericality: { greater_than_or_equal_to: 0, 
                            less_than: BigDecimal(10**10) },
            format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
  validates :payment_detail, presence: true
end
