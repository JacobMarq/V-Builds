class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :users, null: false, foreign_key: true
      t.decimal :total, precision: 12, scale: 2
      t.references :payment_detail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
