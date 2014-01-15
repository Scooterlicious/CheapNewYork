require 'yelp_api' # in the lib folder

class SitesController < ApplicationController
	#before_filter works with Devise to allow only LOGGED IN USERS
	#to do stuff other than pull up an index
	
	#before_filter :authenticate_user!, except: [:index] 
	
	def index
		@sites = Site.all.take(3)
		@sites |= YelpApi.searchZip(86004)
#@sites = Site.all
"THIS IS THE END"
	end

	def new
		@band = Site.new()
	end

	def zipsearch

		@sites = Site.all.take(30)
		@sites |= YelpApi.searchZip(params[:id])
	end

	# def create
	# 	Site.create({
	# 		name: params[:band][:name]
	# 	})
	# 	redirect_to sites_path
	# end


	def show
		@site = Site.find(params[:id])
	end	

	# def destroy 
	# 	Site.find(params[:id]).destroy
	# 	redirect_to sites_path
	# end	

	# def edit
	# 	@band = Site.find(params[:id])
	# end

	# def update
	# 	@band = Site.find(params[:id])
	# 	@band.name = params[:band][:name]
	# 	@band.save
	# 	redirect_to band_path(params[:id])
	# end

end
