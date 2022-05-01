class Attribute < ApplicationRecord
    has_many :type_attributes
    has_many :Types, through: :type_attributes, source: :Type

    has_many :attribute_options
    has_many :options, through: :attribute_options, source: :option

    validates :attribute_name, presence: true
end