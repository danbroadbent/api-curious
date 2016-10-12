require 'rails_helper'

describe "Github User" do
  context '.find_by' do
    it 'returns a GithubUser' do
      current_user = create(:user)
      username = 'danbroadbent'
      github_user = GithubUser.find_by(username, current_user.oauth_token)
      expect(github_user.class).to eq(GithubUser)
      expect(github_user.username).to eq(username)
    end
  end

  context '.current_user' do
    it 'returns authenticated user' do
      current_user = create(:user)
      github_user = GithubUser.current_user(current_user.oauth_token)
      expect(github_user.class).to eq(GithubUser)
      expect(github_user.username).to eq(current_user.uid)
    end
  end
end
