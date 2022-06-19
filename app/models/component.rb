class Component < ApplicationRecord
  belongs_to :type
  has_one :component_inventory

  has_many :component_specification_options
  has_many :specifications, through: :component_specification_options, source: :specification
  has_many :options, through: :component_specification_options, source: :option
  has_many :build_components
  has_many :builds, through: :build_components, source: :build

  validates :part_number, uniqueness: true
  validates :brand, presence: true
  validates :model, presence: true

  validates :ub_rank, numericality: { only_integer: true, greater_than: 0, less_than: 300 }
  validates :ub_benchmark, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**3) }, format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
  validates :ub_samples, numericality: { only_integer: true, greater_than: 0, less_than: 9999999 }
  validates :ub_link, format: { with: /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})/ }

  validates :price_cents,
              numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end