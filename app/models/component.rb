class Component < ApplicationRecord
  belongs_to :type
  has_one :component_inventory
  has_one :component_resource

  has_many :component_specifications
  has_many :specification_options, through: :component_specifications, source: :specification_option
  has_many :specifications, through: :specification_options, source: :specification
  has_many :options, through: :specification_options, source: :option
  has_many :build_components
  has_many :builds, through: :build_components, source: :build

  validates :part_number, uniqueness: true
  validates :brand, presence: true
  validates :model, presence: true

  validates :price_cents,
              numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end