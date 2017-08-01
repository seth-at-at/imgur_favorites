require 'rails_helper'

RSpec.describe "Navigate" do
  context "home" do
    it "sends to imgur on click" do
      visit root_path
      within('#loginButton') do
        expect(page).to have_content("Log in with Imgur")
      end
    end
  end
end
