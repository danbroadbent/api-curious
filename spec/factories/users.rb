FactoryGirl.define do
  factory :user do
    uid "danbroadbent"
    name "Dan Broadbent"
    oauth_token ENV["OAUTH_TOKEN"]
  end
end
