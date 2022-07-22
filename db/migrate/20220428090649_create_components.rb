class CreateComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :components do |t|
      t.string :part_number
      t.string :brand
      t.string :model
      t.integer :price_cents, default: 0
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
    add_index :components, :part_number, unique: true
  end
end
