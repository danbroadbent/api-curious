class GithubUser
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

  def username
    "#{attrs[:login]}"
  end

  # private
    attr_reader :attrs
end
