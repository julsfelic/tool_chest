require 'test_helper'

class AdminCanCreateCategoriesTest < ActionDispatch::IntegrationTest
  test 'they can use admin privledges' do
    username = "Rachel"
    password = "password"

    login_user(username, password, 1)

    visit '/'

    click_on 'create category'

    fill_in 'Name', with: 'cheese'

    click_on 'Create category'

    assert page.has_content?("cheese")


    # an admin visits home page
    # clicks on create category
    # views category index page
    logout_user
  end

  test 'user can not use admin privledges' do
    username = "Rachel"
    password = "password"

    login_user(username, password, 0)


    visit admin_categories_path

    assert page.has_content?("The page you were looking for doesn't exist")

    #a user visits the home page
    # can not click on create category
    logout_user
  end

end
