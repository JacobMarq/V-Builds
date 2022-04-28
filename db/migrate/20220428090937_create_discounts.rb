class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :code
      t.string :description
      t.integer :discount_percent

      t.timestamps
    end
  end
end
