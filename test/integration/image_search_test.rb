require 'helpers/test_helper'
require "mocha/test_unit"

class ImageSearchTest < ActionDispatch::IntegrationTest
  	include ImagesHelper

	def setup
		@user = User.find_by(email: "test@testuser.com")
  	end

	test "test image search" do
	    #log_in_as @user , "sagar123"
    	post login_path, session: { email: @user.email, password: "sagar123" } 
    	

    	flickr_api = get_flickr_api
 
     	# flickr_api.photos.expects(:search).returns(Flickr::Photos::PhotoResponse.new(:page => 1,
      #                           :pages => 22,
      #                           :per_page =>  5,
      #                           :total => 111,
      #                           :photos => [],
      #                           :api => nil,
      #                           :method => 'search',
      #                           :options => []))
    	set_flickr_api(flickr_api)
		get search_path, keyword: "test"

		assert_template 'results'
	end

end
