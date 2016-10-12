class GithubService
  def self.find_user(user)
    response = conn.get '/user', { :access_token => user.oauth_token }
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(:url => 'https://api.github.com') do |faraday|
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end
