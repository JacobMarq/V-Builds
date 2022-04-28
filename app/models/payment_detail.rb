class PaymentDetail < ApplicationRecord
    has_one :order
end
