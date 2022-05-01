class TypicalBuildUsage < ApplicationRecord
    has_many :users

    validates :title, presence: true
    validates :description, presence: true
    validates :gpu_precedent, presence: true,
                numericality: { only_integer: true, in: 0...5 }
    validates :cpu_precedent, presence: true,
                numericality: { only_integer: true, in: 0...5 }
    validates :ram_space_suggestion, presence: true,
                numericality: { only_integer: true },
                inclusion: [1,2,4,8,16,32,64,128]
end