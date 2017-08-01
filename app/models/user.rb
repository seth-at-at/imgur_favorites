class User < ApplicationRecord
  has_many :favorites, through: :favorites_users

  def folders
    Folder.where(user_id: self.id)
  end

  def favorites
    FavoritesUser.where(user_id: self.id).map do |fav|
      Favorite.find(fav.favorite_id)
    end
  end
end
