require "rails_helper"

describe "logged in user visits another user", :type => :feature do
  it 'visits another user' do
    stub_omniauth
    VCR.use_cassette("visits another user") do
      visit "/"
      click_button "Login with Github"
      expect(current_path).to eq('/')
      expect(page).to have_button('Logout')
      click_link "Followers"
      expect(page).to have_content('Followers')
      click_link "iainspad"
      expect(page).to have_content('Iain')
    end
  end
end
