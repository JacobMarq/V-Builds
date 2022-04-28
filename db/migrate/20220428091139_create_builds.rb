class CreateBuilds < ActiveRecord::Migration[7.0]
  def change
    create_table :builds do |t|
      t.decimal :price, precision: 12, scale: 2
      t.references :discount, null: false, foreign_key: true

      t.timestamps
    end
  end
end
