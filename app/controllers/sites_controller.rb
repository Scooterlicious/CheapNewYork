require 'yelp_api' # in the lib folder

class SitesController < ApplicationController
	def index
		@sites = Site.all.take(30)
		YelpApi.method1()
#@sites = Site.all
	end

	def new
		@band = Site.new()
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
