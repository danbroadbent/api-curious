class FollowersController < ApplicationController
  def index
    @followers = GithubUser.followers(current_user.username, current_user.oauth_token)
  end
end
