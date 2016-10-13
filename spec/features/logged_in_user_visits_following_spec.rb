require "rails_helper"

describe "logged in user visits following", :type => :feature do
  it 'visits following' do
    stub_omniauth
    VCR.use_cassette("visits following") do
      visit "/"
      click_button "Login with Github"
      expect(current_path).to eq('/')
      expect(page).to have_button('Logout')
      click_link "Following"
      expect(page).to have_content('Following')
    end
  end
end
