class ComponentTypeSpecificationOption < ApplicationRecord
  belongs_to :component
  belongs_to :type
  belongs_to :specification
  belongs_to :option
end
