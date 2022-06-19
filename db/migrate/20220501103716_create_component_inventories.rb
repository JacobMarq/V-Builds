class CreateComponentInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :component_inventories do |t|
      t.references :components, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
