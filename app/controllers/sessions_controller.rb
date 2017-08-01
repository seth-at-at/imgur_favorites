class SessionsController < ApplicationController
  protect_from_forgery except: [:create]

  def new

  end

  def show

  end

  def create
    par = param_arr(params[:params])
    logger.debug(par) # DEBUG
    logger.debug("15") # DEBUG


    favorites = ImgurService.new.favorites(par["account_username"], par["access_token"])
    logger.debug(favorites) # DEBUG
    logger.debug("20") # DEBUG

    user = User.find_or_create_by(username: par["account_username"])
    logger.debug(user) # DEBUG
    logger.debug("24") # DEBUG

    session[:user_id] = user.id
    user.update(strong_params(par))
    update_favorites(favorites, user)
    redirect_to dashboard_path
  end


  private
    def param_arr(params)
      params.split('&').map do |par|
        par.split('=')
      end.to_h
    end

    def strong_params(par)
      {access: par["access_token"],
       expires: par["expires_in"],
       token_type: par["token_type"],
       ref_token: par["refresh_token"],
       username: par["account_username"],
       account: par["account_id"]}
    end

    def update_favorites(favorites, user)
      favorites.each do |fav|
        fav[:link] = normalize_links(fav[:link], fav)
        if favorite = Favorite.find_or_create_by(image_id: fav[:id], title: fav[:title], description: fav[:description], link: fav[:link], images_count: fav[:images_count])
            FavoritesUser.find_or_create_by(user_id: user.id, favorite_id: favorite.id)
        end
      end
    end

    def normalize_links(link, fav)
      if link.include?("i.")
        return link
      else
        return "https://i.imgur.com/#{fav[:cover]}.jpg"
      end
    end
end
