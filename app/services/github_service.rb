class GithubService
  def self.find_user(username, oauth_token)
    response = conn.get "/users/#{username}", { :access_token => oauth_token }
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.current_user(oauth_token)
    response = conn.get '/user', { :access_token => oauth_token }
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_followers(username, oauth_token)
    response = conn.get "/user/#{username}/followers", { :access_token => oauth_token }
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(:url => 'https://api.github.com') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end
