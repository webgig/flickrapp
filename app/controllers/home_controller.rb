class HomeController < ApplicationController
	include SessionsHelper
  	include ImagesHelper
 	
  	before_action :app_session

  	# Application main page
	def index
		# Fetch list of recent searches
		recent_search = RecentSearch.where("user_id=?",session[:user_id]).order('updated_at desc').all

		render 'index' , :locals =>  {:recent_search => recent_search}
	end	
end
