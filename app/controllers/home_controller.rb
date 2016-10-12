class HomeController < ApplicationController
  def index
    if current_user
    @user = GithubUser.current_user(current_user.oauth_token)
    end
  end
end
