FactoryGirl.define do
  factory :user do
    uid "1234"
    name "Dan Broadbent"
    oauth_token ENV["OAUTH_TOKEN"]
  end
end
