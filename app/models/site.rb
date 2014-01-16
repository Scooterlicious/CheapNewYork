class Site < ActiveRecord::Base
  attr_accessible :address, :name, :zipcode, :cost, :phone, :city, :yelp, :url
  has_many :reviews
  has_many :users, through: :reviews

end
