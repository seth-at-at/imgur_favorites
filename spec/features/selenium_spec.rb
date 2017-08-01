require 'rails_helper'

RSpec.describe "Navigate", js: true do
  before(:each) do
    @user = User.create(username: "seth")
    fav = Favorite.create(title: "title", link: "https://i.imgur.com/qmvGSGtb.jpg")
    FavoritesUser.create(user_id: @user.id, favorite_id: fav.id)
    Folder.create(name: "Gifs", user_id: @user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

    it "creates drop downs on image hovers" do
      visit favorites_path

      find('.userFavorites #1').hover
    end
end
