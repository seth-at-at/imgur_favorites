require 'rails_helper'

RSpec.describe "Navigate"  do
  before(:each) do
    @user = User.create(username: "seth")
    fav = Favorite.create(title: "title", link: "https://i.imgur.com/qmvGSGtb.jpg")
    FavoritesUser.create(user_id: @user.id, favorite_id: fav.id)
    Folder.create(name: "Gifs", user_id: @user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  context "home" do
    it "sends to imgur on click" do
      visit root_path
      within('#loginButton') do
        expect(page).to have_content("Log in with Imgur")
      end
    end

    it "redirects to new folder path" do
      visit dashboard_path
      click_on "Create New Folder!"

      expect(current_path).to eq(new_folder_path)
    end

    it "creates folder and redirects_to dashboard_path" do
      visit new_folder_path

      fill_in :folder_name, with: "Funny"

      click_on "Create"

      expect(current_path).to eq(folder_path(@user.folders.last))

      click_on "Home"

      expect(current_path).to eq(dashboard_path)

      within("div.folder_links #folder#{Folder.last.id}") do
        expect(page).to have_content("Funny")
      end
    end

    it "creates drop downs on image hovers" do
      visit favorites_path
    end
  end
end
