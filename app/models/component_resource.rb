class ComponentResource < ApplicationRecord
    belongs_to :component
    validates :ub_rank, numericality: { only_integer: true, greater_than: 0, less_than: 300 }
    validates :ub_benchmark, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**3) }, format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
    validates :ub_samples, numericality: { only_integer: true, greater_than: 0, less_than: 9999999 }
    validates :ub_link, format: { with: /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})/ }
end
