class CreateComponentTypeSpecificationOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :component_type_specification_options do |t|
      t.references :component, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true
      t.references :specification, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
