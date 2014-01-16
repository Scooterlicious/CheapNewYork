require 'yelp_api' # in the lib folder

class SitesController < ApplicationController	
	def index
		@sites = Site.all.take(4)
	end

	def new
		@band = Site.new()
	end

	def zipsearch
		@sites = Site.all.take(4)
		@sites |= YelpApi.searchZip(params[:zipcode])
		session[:zipcode] = params[:zipcode]
	end

	def show
		@site = Site.find(params[:id])
	end	
end
