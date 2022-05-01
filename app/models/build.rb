class Build < ApplicationRecord
  belongs_to :discount
  belongs_to :type
  
  has_many :build_components
  has_many :components, through: :build_components, source: :component

  has_many :user_builds
  has_many :users, through: :user_builds, source: :user

  has_many :order_items
  has_many :orders, through: :order_items, source: :order

  validates :price, presence: true, 
            numericality: { greater_than_or_equal_to: 0, 
                            less_than: BigDecimal(10**10) },
            format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
  validates :discount, presence: true
end
