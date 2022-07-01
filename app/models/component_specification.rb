class ComponentSpecification < ApplicationRecord
  belongs_to :component
  belongs_to :specification_option
end
