class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.string :image_id
      t.string :title
      t.string :description
      t.string :link
      t.integer :images_count
    end
  end
end
