require 'rails_helper'

RSpec.describe Folder, type: :model do
  it "Folder.images returns the favorites nested inside" do
    folder = Folder.create(name: "Funny")
    fav = Favorite.create(title: "Funny")
    FavoritesFolders.create(favorite_id: fav.id, folder_id: folder.id)

    expect(folder.images).to eq([fav])
  end
end
