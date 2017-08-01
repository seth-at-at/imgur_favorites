class ImgurService
  def initialize
    @conn = Faraday.new("https://api.imgur.com/oauth2")
    @base_url = Faraday.new("https://api.imgur.com/oauth2/token")
    @id = ENV['client_id']
  end

  def authorize
    "https://api.imgur.com/oauth2/authorize?client_id=f2069059417d53d&response_type=token"
  end

  def token(t)
    base_url.get("token=#{t}")
  end

  def favorites(username, token)
    parse(HTTParty.get("https://api.imgur.com/3/account/#{username}/favorites/page/favoritesSort",
          :headers => { :Authorization => "Bearer #{token}"}))[:data]
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :conn, :base_url
end
