class ImagesController < ApplicationController


	def search
		flickr = Flickr.new(File.join(Rails.root, 'config', 'flickr.yml'))

		photos = flickr.photos.search(:tags => 'ruby-flickr')

		render 'results'
	end

end
