require "rails_helper"

describe "logged in user visits followers", :type => :feature do
  it 'visits followers' do
    stub_omniauth
    VCR.use_cassette("visits followers") do
      visit "/"
      click_button "Login with Github"
      expect(current_path).to eq('/')
      expect(page).to have_button('Logout')
      click_link "Followers"
      expect(page).to have_content('Followers')
    end
  end
end
