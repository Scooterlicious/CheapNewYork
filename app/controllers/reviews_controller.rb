class ReviewsController < ApplicationController
	before_filter :authenticate_user!, :only => [:new] #, except: [:index] 
	
	def new
		@site = Site.find(params[:site_id])
	end

	def create
		@review = Review.create()
		@review.rating = params[:rating]
		@review.written_text = params[:written_text]
		@review.site_id = params[:site_id]
		@review.user_id = session["user_id"]
		@review.save
		redirect_to site_review_path(params[:site_id], @review)
	end

	def show
		@review = Review.find(params[:id])
	end
end
