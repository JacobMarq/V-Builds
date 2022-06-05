class AddTypicalUsagesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :typical_usages, null: false, foreign_key: true
  end
end
