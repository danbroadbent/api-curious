require "rails_helper"

describe "logged in user visits following feed", :type => :feature do
  it 'visits following feed' do
    stub_omniauth
    VCR.use_cassette("visits following feed") do
      visit "/"
      click_button "Login with Github"
      expect(current_path).to eq('/')
      expect(page).to have_button('Logout')
      click_link "Following Feed"
      expect(page).to have_content('Users I Follow Activity')
    end
  end
end
