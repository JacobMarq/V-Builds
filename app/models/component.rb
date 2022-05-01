class Component < ApplicationRecord
  belongs_to :type
  belongs_to :component_inventory

  has_many :build_components
  has_many :builds, through: :build_components, source: :build

  validates :part_number
  validates :brand, presence: true
  validates :model, presence: true
  validates :price, presence: true, 
            numericality: { greater_than_or_equal_to: 0, 
                            less_than: BigDecimal(10**10) },
            format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
  validates :ub_rank, numericality: { only_integer: true, greater_than: 0, less_than: 1000 }
  validates :ub_benchmark, numericality: { only_integer: true, greater_than: 0, less_than: 500 }
  validates :ub_samples, numericality: { only_integer: true, greater_than: 0, less_than: 100000 }
  validates :ub_link, format: { with: /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})/ }
  validates :type, presence: true
  validates :component_inventory, presence: true
end
