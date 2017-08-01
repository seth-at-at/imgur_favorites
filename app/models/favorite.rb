class Favorite < ApplicationRecord
  has_many :users, through: :favorites_users
  has_many :folders, through: :favorites_folders
end
