class Specification < ApplicationRecord
    has_many :type_specifications
    has_many :types, through: :type_specifications, source: :type

    has_many :specification_options
    has_many :options, through: :specification_options, source: :option

    validates :name, presence: true, uniqueness: true
end