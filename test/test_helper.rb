ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def create_user(name, password, role = 0)
    return User.create(username: name, password: password, role: role)
  end

  def create_tool
    return Tool.create(name: "hammer", price: 10, quantity: 10)
  end

  def login_user(username, password, role = 0)
    user = create_user(username, password, role)
    user.tools << create_tool

    visit '/'

    click_on 'log in'

    fill_in 'Username', with: username
    fill_in 'Password', with: password

    click_on 'Log in'
    return user
  end

  def logout_user
    visit '/'
    click_on 'log out'
  end



  # def teardown
  #   session.clear
  # end
end
