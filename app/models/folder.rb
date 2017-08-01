class Folder < ApplicationRecord
  belongs_to :user
  has_many :favorites

  def favorites
    []
  end

  def add_to_favorites(image)
    favorites << image
  end
end
