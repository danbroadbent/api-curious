class ReceivedEventsController < ApplicationController
  def index
    @events = GithubEvent.received_events(params[:id], current_user.oauth_token)
  end
end
