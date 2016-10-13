class GithubUsersController < ApplicationController
  def show
    if current_user
      @user = GithubUser.find_by(params[:id], current_user.oauth_token)
    end
  end
end
