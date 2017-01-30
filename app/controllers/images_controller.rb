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
    	   current_page = 1
    	end

		# Initialize the Flickr Api
		flickr = Flickr.new(File.join(Rails.root, 'config', 'flickr.yml'))
		# Perform the photos search
		photos = flickr.photos.search(:tags => params[:keyword],:per_page => Rails.configuration.x.flickr.per_page, :page => current_page)
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
