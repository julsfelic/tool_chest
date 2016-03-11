require 'test_helper'

class UserLogInTest < ActionDispatch::IntegrationTest
  test "they can navigate to their page and see their items" do
    username = 'Rachel'
    password = 'password1'
    user = create_user(username, password)
    user.tools << create_tool

    visit '/'

    click_on 'log in'

    fill_in 'Username', with: username
    fill_in 'Password', with: password

    click_on 'Log in'

    assert page.has_content?("hammer")
    logout_user
  end
end
