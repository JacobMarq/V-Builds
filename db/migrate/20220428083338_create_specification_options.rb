class CreateSpecificationOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :specification_options do |t|
      t.references :specification, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
