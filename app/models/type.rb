class Type < ApplicationRecord
    has_many :components

    has_many :type_specifications
    has_many :specifications, through: :type_specifications, source: :specification

    validates :name, presence: true, uniqueness: true
end
