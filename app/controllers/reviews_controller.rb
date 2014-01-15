class ReviewsController < ApplicationController

	def new
	end


	def create
		@review = Review.create()
		@review.rating = params[:rating]
		@review.written_text = params[:written_text]
		@review.site_id = params[:site_id]
		@review.user_id = session["user_id"]
		@review.save

#site_review GET    /sites/:site_id/reviews/:id(.:format)      reviews#show
		redirect_to site_review_path(params[:site_id], @review)
	end

	def show
		@review = Review.find(params[:id])
	end


end
