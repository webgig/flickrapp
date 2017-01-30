module ImagesHelper
	
	FLICKR_CONFIG =  File.join(Rails.root, 'config', "flickr.yml")
	@@api = nil

	def push_recent_search(search_keyword)
		# Retrieve the recent searches for current user
		@recent_search = RecentSearch.where("user_id=?",session[:user_id]).order('updated_at asc').all
		
		# Retrieve if a match is found with the current search_keyword
		rcs = RecentSearch.find_by(keyword: search_keyword)
		
		if rcs.nil?
		   rcs = RecentSearch.new(:user_id=>session[:user_id])
		   rcs.keyword = search_keyword
		else
		   rcs.touch(:updated_at)   
		end	

	    rcs.save
    	
    	# If the recent_search is greater than the 
		if @recent_search.size > Rails.configuration.x.flickr.recent_search_limit
		 	@recent_search.first.delete
		end
	
	end

	# Returns the flickr api
	def get_flickr_api
		
		# Set the flicker api if its not already set
		if @@api.nil?
			set_flickr_api
		end
		
		@@api
	end	

	# Sets the flickr api
	def set_flickr_api( api = nil )
		if !api.nil?
			@@api = api
		else 
			@@api = Flickr.new(FLICKR_CONFIG)
		end	
	end	
		
end
