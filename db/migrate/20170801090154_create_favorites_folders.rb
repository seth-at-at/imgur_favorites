class CreateFavoritesFolders < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites_folders do |t|
      t.integer :folder_id
      t.integer :favorite_id
    end
  end
end
