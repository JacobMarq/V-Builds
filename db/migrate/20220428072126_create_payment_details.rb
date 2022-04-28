class CreatePaymentDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_details do |t|
      t.decimal :amount, precision: 12, scale: 2, null: false
      t.string :provider, null: false
      t.string :status, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
