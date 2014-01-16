class YelpApi
	class YelpSite 
		attr_accessor :cost, :name, :address, :city, :zipcode, :rating, :reviews, :yelp, :url

		def initialize(cost, name, address, city, zip, rating, url)
			@cost = cost
			@name = name
			@address = address
			@city = city
			@zipcode = zip
			@rating = rating
			@yelp = true
			@reviews = []
			@url = url
#binding.pry
		end
	end



	def self.searchZip(inZip)
		#def yelp_test_query
			Yelp.configure(
				:yws_id          => ENV['YELP_YWSID'],
				:consumer_key    => ENV['YELP_CONSUMER_KEY'],
				:consumer_secret => ENV['YELP_CONSUMER_SECRET'],
				:token           => ENV['YELP_TOKEN'],
				:token_secret    => ENV['YELP_TOKEN_SECRET'])

			 # construct a client instance
			 client = Yelp::Client.new

			 include Yelp::V1::Review::Request
			 # perform an address/location-based search for cream puffs nearby

			 request = Location.new(
	             # :address => '650 Mission St',
	             #:city => 'New York',
	             #:state => 'NY',
	             :radius => 1,
	             :zipcode => inZip,
	             :term => 'restaurant',
	             :business_count => 5)

			site_array = []

			response = client.search(request)
			business_array = response["businesses"]
			business_array.each do |business|
				cost = "$"
				name = business["name"]
				address = business["address1"]
				city = business["city"]
				zip = business["zip"]
				url = business["url"]

				review_array = business["reviews"]
				rating_sum = 0

				siteclassobject = YelpSite.new(
					cost, name, address, city, 
					zip, 0, url)
#binding.pry
				review_array.each do |review|
					rating_sum += review["rating"]
					siteclassobject.reviews.push(
						[review["rating"], 
						review["text_excerpt"]]
						)
				end
				rating = rating_sum / review_array.size
				siteclassobject.rating = rating
#binding.pry
				site_array << siteclassobject
			end
#binding.pry			
		return site_array

	end #	def self.searchZip(inZip)

end #class
