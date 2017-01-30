require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Sagar Bhandari", email: "test@testuser.com", password:"test123",password_confirmation:"test123")
  end

  test "should be valid" do
    assert_not @user.valid?
  end	

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

end
