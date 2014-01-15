require 'yelp_api' # in the lib folder

class SitesController < ApplicationController
	#before_filter works with Devise to allow only LOGGED IN USERS
	#to do stuff other than pull up an index
	
	#before_filter :authenticate_user!, except: [:index] 
	
	def index
		@sites = Site.all.take(1)
		# @sites |= YelpApi.searchZip(10045) 
	end

	def new
		@band = Site.new()
	end

	def zipsearch
		#@sites = Site.all.take(2)
		#@sites |= YelpApi.searchZip(params[:zipsearch])
		@sites = YelpApi.searchZip(params[:zipcode])
	end

	def show
		@site = Site.find(params[:id])
	end	
end
