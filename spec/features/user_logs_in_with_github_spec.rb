require "rails_helper"

describe "log in with github", :type => :feature do
  it 'logs in' do
    stub_omniauth
    VCR.use_cassette("login with github") do
    visit "/"
    expect(page.status_code).to be(200)
    click_button "Login with Github"
    expect(current_path).to eq('/')
    expect(page).to have_content('Dan')
    expect(page).to have_button('Logout')
  end
  end
end
