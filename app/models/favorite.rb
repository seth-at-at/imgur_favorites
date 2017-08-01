class Favorite < ApplicationRecord
  has_many :users, through: :favorites_users
end
