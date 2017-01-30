require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid user information" do
    get signup_path
    
    assert_no_difference 'User.count' do
      	post users_path, user: { name:  "", email: "testuser@test.com", password: "asbasas", password_confirmation: "aaaa" } 
    end
    
    assert_template 'users/new'
  end
end
