class CreateTypeSpecifications < ActiveRecord::Migration[7.0]
  def change
    create_table :type_specifications do |t|
      t.references :type, null: false, foreign_key: true
      t.references :specification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
