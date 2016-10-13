require 'rails_helper'

describe "Github User" do
  context '.find_by' do
    it 'returns a GithubUser' do
      VCR.use_cassette("user.find_by") do
        current_user = create(:user)
        username = 'danbroadbent'
        github_user = GithubUser.find_by(username, current_user.oauth_token)
        expect(github_user.class).to eq(GithubUser)
        expect(github_user.attrs[:login]).to eq(username)
      end
    end
  end

  context '.current_user' do
    it 'returns authenticated user' do
      VCR.use_cassette("user.current_user") do
        current_user = create(:user)
        github_user = GithubUser.current_user(current_user.oauth_token)
        expect(github_user.class).to eq(GithubUser)
        expect(github_user.attrs[:login]).to eq(current_user.uid)
      end
    end
  end

  context '.followers' do
    it 'returns followers' do
      VCR.use_cassette("user.followers") do
        current_user = create(:user)
        username = 'danbroadbent'
        followers = GithubUser.followers(username, current_user.oauth_token)
        follower = followers.first
        expect(followers.count).to eq(2)
        expect(follower.attrs[:login]).to eq('iainspad')
      end
    end
  end
end
