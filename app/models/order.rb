class Order < ApplicationRecord
  enum payment_gateway: { stripe: 0, paypal: 1 }

  belongs_to :user

  has_many :order_items
  has_many :builds, through: :order_items, source: :build

  validates :users, presence: true
  validates :amount_cents, presence: true,
              numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :payment_detail, presence: true
  
  scope :recently_created, ->  { where(created_at: 1.minutes.ago..DateTime.now) }

  def set_paypal_executed
    self.status = Order.statuses[:paypal_executed]
  end

  def get_product_list
    list = ""
    for component in self.builds.components do
      list << component.model + " "
    end
  end
end
