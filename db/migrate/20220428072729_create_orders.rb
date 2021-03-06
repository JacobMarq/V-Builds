class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :users, null: false, foreign_key: true
      t.integer :amount_cents, default: 0
      t.string :customer_id
      t.string :payment_gateway
      t.string :payment_intent_id

      t.timestamps
    end
  end
end
