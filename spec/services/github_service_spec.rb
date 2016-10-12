require 'rails_helper'

describe "GithubService" do

  it 'works' do
    expect(true).to be(true)
  end

  it 'gets authenticated user' do
    current_user = create(:user)
    github_user = GithubService.current_user(current_user)
    expect(github_user[:name]).to eq("Dan Broadbent")
  end

  it 'gets users by username' do
    github_user = GithubService.find_user(username)
    expect(github_user[:username]).to eq('username')
  end
end
