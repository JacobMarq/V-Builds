class CreateTypeAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :type_attributes do |t|
      t.references :type, null: false, foreign_key: true
      t.references :attribute, null: false, foreign_key: true

      t.timestamps
    end
  end
end
