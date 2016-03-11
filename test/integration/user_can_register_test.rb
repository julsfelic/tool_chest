require 'test_helper'

class UserCanRegisterTest < ActionDispatch::IntegrationTest
  test "user creates an account" do
    username = 'Rachel'
    password = 'password1'

    visit '/'

    click_on 'register'

    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_on 'Create User'

    assert page.has_content?("welcome #{username}!")
    # user visits home page
    # clicks on register user
    # fills in username
    # fills in password
    # clicks submit
    # sees their individual page with their tools
    #it says welcome Rachel!
    logout_user
  end
end
