require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest


  test "login with valid credentials" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "test@testuser.com", password: "sagar123" } 
    assert flash.empty?
    get home_path
    assert flash.empty?
  end

  test "login with invalid credentials" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "asasabs@asas.com", password: "asasas" } 
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

end
