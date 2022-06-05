class AddComponentInventoryToComponents < ActiveRecord::Migration[7.0]
  def change
    add_reference :components, :component_inventories, null: false, foreign_key: true
  end
end
