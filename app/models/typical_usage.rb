class TypicalUsage < ApplicationRecord
    has_many :users

    validates :title, presence: true
    validates :description, presence: true
    validates :gpu_precedent, presence: true,
                numericality: { only_integer: true },
                inclusion: [0,1]
    validates :cpu_precedent, presence: true,
                numericality: { only_integer: true },
                inclusion: [0,1]
    validates :ram_size_suggestion, presence: true,
                numericality: { only_integer: true },
                inclusion: [16,32]
end