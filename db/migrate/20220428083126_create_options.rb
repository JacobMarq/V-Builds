class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.string :value

      t.timestamps
    end
    add_index :options, :value, unique: true
  end
end
