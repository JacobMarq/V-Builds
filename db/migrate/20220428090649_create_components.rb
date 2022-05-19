class CreateComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :components do |t|
      t.string :part_number
      t.string :brand
      t.string :model
      t.integer :price_cents, default: 0
      t.integer :ub_rank
      t.integer :ub_benchmark
      t.integer :ub_samples
      t.string :ub_link
      t.references :type, null: false, foreign_key: true
      t.references :component_inventory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
