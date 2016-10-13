class RepositoriesController < ApplicationController
  def index
    @repositories = GithubRepository.repositories(params[:id], current_user.oauth_token)
  end
end
