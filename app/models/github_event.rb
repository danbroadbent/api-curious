class GithubEvent
  attr_reader :attrs

  def initialize(attrs)
    @attrs = attrs
  end

def self.events(username, oauth_token)
  GithubService.events(username, oauth_token).map do |repository|
    GithubEvent.new(repository)
  end
end

end
