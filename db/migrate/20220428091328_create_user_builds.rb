class CreateUserBuilds < ActiveRecord::Migration[7.0]
  def change
    create_table :user_builds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :build, null: false, foreign_key: true

      t.timestamps
    end
  end
end
