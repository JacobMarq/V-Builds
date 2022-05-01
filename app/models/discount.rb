class Discount < ApplicationRecord
    has_many :builds

    validates :code, presence: true
    validates :description, presence: true
    validates :discount_percent, presence: true, 
                numericality: { only_integer: true,
                                less_than: 91, 
                                greater_than: 0 }
end
