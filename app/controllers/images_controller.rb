class ImagesController < ApplicationController
  	
  	before_action :app_session
	
	include SessionsHelper
  	include ImagesHelper
	
	# For searching and displaying  photos
	def search
		# Check if the keyword is blank
    	if params[:keyword].blank?
		    flash.now[:danger] =  "Please provide a search keyword"
		    return redirect_to "/home"
    	end	

    	current_page = params[:page]

    	if current_page.blank?
    	   current_page = 1 # Default current page
    	end

		# Initialize the Flickr Api
		# The following DI mechanims has been user to inject dependency to make the code more testable. 
		# We could inject a mock api class to avoid real api interaction during testing
		flickr = get_flickr_api 

		# Perform the photos search
		photos = flickr.photos.search(:tags => params[:keyword],:per_page => Rails.configuration.x.flickr.per_page, :page => current_page)
		photos.pages;
		# Manage the recent search list
		push_recent_search params[:keyword]
			
		recent_search = RecentSearch.where("user_id=?",session[:user_id]).order('updated_at desc').all

		render 'results' , :locals =>  {:keyword => params[:keyword],:photos => photos,:current_page => current_page,:recent_search => recent_search}
	end

	# For Rendering Full Size Image
	def view
		render 'image' ,:locals=>{:image=> {url: params[:url],title: params[:title]}}
	end
		
end
