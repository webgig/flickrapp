require 'helpers/test_helper'

class ImageSearchTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.find_by(email: "test@testuser.com")
  	end

	test "test image search" do
	    #log_in_as @user , "sagar123"
    	post login_path, session: { email: @user.email, password: "sagar123" } 

		get search_path, keyword: "test"

		assert_template 'results'
	end

end
