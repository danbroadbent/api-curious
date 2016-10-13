class FollowingController < ApplicationController
  def index
    @followings = GithubUser.followings(params[:id], current_user.oauth_token)
  end
end
