class HomeController < ApplicationController
  def index
    @imgur_url = ImgurService.new.authorize
  end
end
