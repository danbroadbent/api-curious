require 'rails_helper'

describe "GithubService" do

  it 'gets authenticated user' do
    current_user = create(:user)
    github_user = GithubService.current_user(current_user.oauth_token)
    expect(github_user[:name]).to eq("Dan Broadbent")
  end

  it 'gets user by username' do
    current_user = create(:user)
    username = 'danbroadbent'
    github_user = GithubService.find_user(username, current_user.oauth_token)
    expect(github_user[:login]).to eq(username)
  end
end
