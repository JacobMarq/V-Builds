class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.references :shopping_session, null: false, foreign_key: true
      t.references :build, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
