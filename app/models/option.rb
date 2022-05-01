class Option < ApplicationRecord
    has_many :attribute_options
    has_many :attributes, through: :attribute_options, source: :attribute

    validates :option_value, presence: true
end
