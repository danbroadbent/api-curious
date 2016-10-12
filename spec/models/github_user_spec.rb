require 'rails_helper'

describe "Github User" do
  context '.find_by' do
    it 'returns a GithubUser' do
      user = GithubUser.find_by(username)
      expect(user.class).to eq(GithubUser)
      expect(user.username).to eq(username)
    end
  end
end
