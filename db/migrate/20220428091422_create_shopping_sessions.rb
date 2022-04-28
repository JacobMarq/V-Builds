class CreateShoppingSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total, precision: 12, scale: 2

      t.timestamps
    end
  end
end
