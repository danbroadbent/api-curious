require "spec_helper"

describe "log in with github", :type => :feature do
  it 'logs in' do
    stub_omniauth
    visit "/"
    expect(page.status_code).to be(200)
    click_button "Login with Github"
    expect(current_path).to eq('/')
    expect(page).to have_content('Dan')
    expect(page).to have_button('Logout')
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
