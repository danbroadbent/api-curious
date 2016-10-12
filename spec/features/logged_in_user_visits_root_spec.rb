require "spec_helper"

describe "log in with github", :type => :feature do
  it 'logs in' do
    stub_omniauth
    VCR.use_cassette("login with github") do
      visit "/"
      click_button "Login with Github"
      expect(current_path).to eq('/')
      expect(page).to have_button('Logout')
      expect(page).to have_content('Followers')
      expect(page).to have_content('Following')
    end
  end
end

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: 'github',
    extra: {
      raw_info: {
        user_id: "1234",
        name: "Dan",
        screen_name: "dan"
      }
    },
    credentials: {
      token: "youknowit",
    }
    })
  end
