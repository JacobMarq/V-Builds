class Build < ApplicationRecord
  belongs_to :discount
  belongs_to :type
  
  has_many :build_components
  has_many :components, through: :build_components, source: :component

  has_many :user_builds
  has_many :users, through: :user_builds, source: :user

  has_many :order_items
  has_many :orders, through: :order_items, source: :order

  validates :price_cents, presence: true,
              numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :discount, presence: true
end
