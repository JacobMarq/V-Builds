class ComponentSpecificationOption < ApplicationRecord
  belongs_to :component
  belongs_to :specification
  belongs_to :option
end
