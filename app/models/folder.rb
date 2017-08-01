class Folder < ApplicationRecord
  belongs_to :user

  def favorites
    []
  end

  def add_to_favorites(image)
    favorites << Favorite.find(image)
  end
end
