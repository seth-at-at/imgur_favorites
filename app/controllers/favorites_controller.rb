class FavoritesController < ApplicationController
  require 'will_paginate/array'

  def index
    @favorites = FavoritesUser.where(user_id: current_user.id).map do |fu|
      Favorite.find(fu.favorite_id)
    end.paginate(:page => params[:page], :per_page => 16)
    @folders = Folder.where(user: current_user)
  end
end
