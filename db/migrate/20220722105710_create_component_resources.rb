class CreateComponentResources < ActiveRecord::Migration[7.0]
  def change
    create_table :component_resources do |t|
      t.references :component, null: false, foreign_key: true
      t.integer :ub_rank
      t.decimal :ub_benchmark, precision: 5, scale: 2
      t.integer :ub_samples
      t.string :ub_link
      t.integer :ne_rank

      t.timestamps
    end
  end
end
