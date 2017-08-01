class HomeController < ApplicationController
  def index
    @imgur_url = ImgurService.new.authorize
    session.clear if params["session"] == "clear"
  end
end
