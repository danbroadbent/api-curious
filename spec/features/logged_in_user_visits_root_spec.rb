require "rails_helper"

describe "logged in user visits root", :type => :feature do
  it 'visits root' do
    stub_omniauth
    VCR.use_cassette("visits root") do
      visit "/"
      click_button "Login with Github"
      expect(current_path).to eq('/')
      expect(page).to have_button('Logout')
      expect(page).to have_content('Followers')
      expect(page).to have_content('Following')
    end
  end
end
