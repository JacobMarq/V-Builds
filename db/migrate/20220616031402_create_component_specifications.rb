class CreateComponentSpecifications < ActiveRecord::Migration[7.0]
  def change
    create_table :component_specifications do |t|
      t.references :component, null: false, foreign_key: true
      t.references :specification_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
