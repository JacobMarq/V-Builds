class CreateTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :types do |t|
      t.string :name

      t.timestamps
    end
    add_index :types, :name, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
