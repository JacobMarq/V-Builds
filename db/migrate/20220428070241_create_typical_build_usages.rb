class CreateTypicalBuildUsages < ActiveRecord::Migration[7.0]
  def change
    create_table :typical_build_usages do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :gpu_precedent, null: false
      t.integer :cpu_precedent, null: false
      t.integer :ram_space_suggestion, null: false

      t.timestamps
    end
  end
end
