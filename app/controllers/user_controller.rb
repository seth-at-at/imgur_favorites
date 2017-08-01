class UserController < ApplicationController
  def index
    # @current_user = current_user
    user = User.find(session[:user_id])

    @favorites = FavoritesUser.where(user_id: user.id).map do |fu|
      Favorite.find(fu.favorite_id)
    end
  end
end
