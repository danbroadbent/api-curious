class GithubRepository
  attr_reader :attrs

  def initialize(attrs)
    @attrs = attrs
  end

def self.repositories(username, oauth_token)
  GithubService.repositories(username, oauth_token).map do |repository|
    GithubRepository.new(repository)
  end
end

end
