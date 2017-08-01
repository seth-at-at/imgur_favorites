require 'rails_helper'

RSpec.describe User, type: :model do
  it "returns a users folders" do
    user = User.create(username: "Seth")
    folder = Folder.create(user_id: user.id)

    expect(user.folders).to eq([folder])
  end

  it "returns a users favorites" do
    user = User.create(username: "Seth")
    favorite = Favorite.create(title: "hello")
    FavoritesUser.create(user_id: user, favorite_id: favorite.id)

    expect(user.favorites).to eq([])
  end
end
