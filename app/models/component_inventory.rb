class ComponentInventory < ApplicationRecord
    belongs_to :component

    validates :quantity, presence: true,
                numericality: { only_integer: true, greater_than: 0 }
end
