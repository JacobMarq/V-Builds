class Type < ApplicationRecord
    has_many :components

    has_many :type_attributes
    has many :attributes, through: :type_attributes, source: :attribute

    validates :type_name, presence: true, uniqueness: true
end
