class CreateAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :attributes do |t|
      t.string :attribute_name

      t.timestamps
    end
  end
end
