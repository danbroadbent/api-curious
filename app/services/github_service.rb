class GithubService
  def self.find_user(user)
    conn = Faraday.new(:url => 'https://api.github.com/') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get '/user', user.oauth_token
    JSON.parse(response.body)
  end

end


# def self.legislators(filter)
#     response = conn.get "/legislators", filter
#     JSON.parse(response.body, symbolize_names: true)[:results]
#   end
#
#   def self.conn
#     Faraday.new(:url => 'https://congress.api.sunlightfoundation.com') do |faraday|
#       faraday.adapter  Faraday.default_adapter
#       faraday.params[:apikey] = ENV["sunlight_api_key"]
#     end
#   end
