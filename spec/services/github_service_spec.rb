require 'rails_helper'

describe "GithubService" do

  it 'works' do
    expect(true).to be(true)
  end

  it 'gets profile info' do
    github_user = GithubService.find_user(user)
    expect(profile[:name]).to eq("Dan Broadbent")
  end
end
