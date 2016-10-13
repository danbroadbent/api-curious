require "rails_helper"

describe "logged in user visits event feed", :type => :feature do
  it 'visits event feed' do
    stub_omniauth
    VCR.use_cassette("visits event feed") do
      visit "/"
      click_button "Login with Github"
      expect(current_path).to eq('/')
      expect(page).to have_button('Logout')
      click_link "My Feed"
      expect(page).to have_content('My Recent Activity')
    end
  end
end
