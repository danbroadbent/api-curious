require 'rails_helper'

describe "GithubService" do

  it 'works' do
    expect(true).to be(true)
  end

  it 'gets profile info' do
    current_user = create(:user)
    github_user = GithubService.find_user(current_user)
    expect(github_user[:name]).to eq("Dan Broadbent")
  end
end
