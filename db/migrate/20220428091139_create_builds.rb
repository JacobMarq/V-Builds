class CreateBuilds < ActiveRecord::Migration[7.0]
  def change
    create_table :builds do |t|
      t.integer :price_cents, default: 0
      t.references :discount, null: false, foreign_key: true

      t.timestamps
    end
  end
end
