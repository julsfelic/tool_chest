require 'test_helper'

class UserCanLogOutTest < ActionDispatch::IntegrationTest
  test "user can log out of while they are logged in" do
    username = "Rachel"
    password = "password1"
    login_user(username, password)

    visit '/'

    click_on 'log out'

    assert page.has_content?("Goodbye #{username}")


    #a logged user visits the home page
    #clicks on log out
    #is logged out of their session and dismissed with goodbye
  end
end
