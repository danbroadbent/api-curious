class EventsController < ApplicationController
  def index
    @events = GithubEvent.events(params[:id], current_user.oauth_token)
  end
end
