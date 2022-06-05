class Option < ApplicationRecord
    has_many :specification_options
    has_many :specifications, through: :specification_options, source: :specification

    validates :value, presence: true
end
