require 'rails_helper'

describe "GithubService" do

  it 'gets authenticated user' do
    VCR.use_cassette("github_service authenticated_user") do
      current_user = create(:user)
      github_user = GithubService.current_user(current_user.oauth_token)
      expect(github_user[:name]).to eq("Dan Broadbent")
    end
  end

  it 'gets user by username' do
    VCR.use_cassette("github_service github_user") do
      current_user = create(:user)
      username = 'danbroadbent'
      github_user = GithubService.find_user(username, current_user.oauth_token)
      expect(github_user[:login]).to eq(username)
    end
  end

  it 'gets followers by username' do
    VCR.use_cassette("github_service github_followers") do
      current_user = create(:user)
      username = 'danbroadbent'
      followers = GithubService.find_followers(username, current_user.oauth_token)
      expect(followers.count).to eq(2)
    end
  end
end
