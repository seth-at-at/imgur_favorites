class FavoritesController < ApplicationController
  def index
    @favorites = FavoritesUser.where(user_id: current_user.id).map do |fu|
      Favorite.find(fu.favorite_id)
    end
  end
end
