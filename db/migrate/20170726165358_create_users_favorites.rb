class CreateUsersFavorites < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :favorites do |t|
      t.integer :user_id
      t.integer :favorite_id
      t.timestamps
    end
  end
end
