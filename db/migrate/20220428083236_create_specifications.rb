class CreateSpecifications < ActiveRecord::Migration[7.0]
  def change
    create_table :specifications do |t|
      t.string :name

      t.timestamps
    end
    add_index :specifications, :name, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
