class PaymentDetail < ApplicationRecord
    has_one :order

    validates :amount, presence: true, 
                numericality: { greater_than_or_equal_to: 0, 
                                less_than: BigDecimal(10**10) },
                format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
    validates :provider, presence: true
    validates :status, presence: true
end
