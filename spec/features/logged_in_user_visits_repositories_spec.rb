require "rails_helper"

describe "logged in user visits repositories", :type => :feature do
  it 'visits repositories' do
    stub_omniauth
    VCR.use_cassette("visits repositories") do
      visit "/"
      click_button "Login with Github"
      expect(current_path).to eq('/')
      expect(page).to have_button('Logout')
      click_link "Repositories"
      expect(page).to have_content('Repositories')
    end
  end
end
