class Folder < ApplicationRecord
  belongs_to :user
  has_many :favorites, through: :favorites_folders

  def images
    FavoritesFolders.where(folder_id: self.id).map do |ff|
      Favorite.find(ff.favorite_id)
    end
  end
end
