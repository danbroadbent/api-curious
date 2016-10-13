class GithubUser
  attr_reader :attrs

  def initialize(attrs)
    @attrs = attrs
  end

  def self.find_by(username, oauth_token)
    raw_user = GithubService.find_user(username, oauth_token)
    GithubUser.new(raw_user)
  end

  def self.current_user(oauth_token)
    raw_user = GithubService.current_user(oauth_token)
    GithubUser.new(raw_user)
  end

  def self.followers(username, oauth_token)
    GithubService.followers(username, oauth_token).map do |raw_follower|
      GithubUser.new(raw_follower)
    end
  end
end
