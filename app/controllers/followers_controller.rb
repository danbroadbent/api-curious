class FollowersController < ApplicationController
  def index
    @followers = GithubUser.followers(params[:id], current_user.oauth_token)
  end
end
