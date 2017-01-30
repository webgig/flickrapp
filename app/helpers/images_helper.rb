module ImagesHelper

	def push_recent_search(search_keyword)
		@recent_search = RecentSearch.where("user_id=?",session[:user_id]).order('updated_at asc').all
		
		rcs = RecentSearch.find_by(keyword: search_keyword)
	
		if rcs.nil?
		   rcs = RecentSearch.new(:user_id=>session[:user_id])
		   rcs.keyword = search_keyword
		else
		   rcs.touch(:updated_at)   
		end	

	    rcs.save
    	
		if @recent_search.size >= 10
		 	@recent_search.first.delete
		end
	
	end
		
end
