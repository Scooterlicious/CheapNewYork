require 'yelp_api' # in the lib folder

class SitesController < ApplicationController	
	def index
		@sites = Site.all.take(4)
#binding.pry
#		@sites |= YelpApi.searchZip(10010) 
	end

	def new
		@band = Site.new()
	end

	def zipsearch
		@sites = Site.all.take(4)
		@sites |= YelpApi.searchZip(params[:zipcode])
		session[:zipcode] = params[:zipcode]
binding.pry
	end

	def show
		@site = Site.find(params[:id])
	end	
end
