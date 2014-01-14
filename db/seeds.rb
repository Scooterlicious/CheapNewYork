# This file should contain all the record creation needed to 
# seed the database with its default values.
# The data can then be loaded with the rake db:seed (or 
	#created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


## Seed the SITES database with the information from our JSON file
## The JSON file is expected to live in the 

# Setup indicies
name_idx = 9
address_idx = 10
city_idx = 11
url_idx = 12
phone_num_idx = 13
cost_idx = 14
postal_code_idx = 15

# Seed data file
seed_data_filename = './db/migrate/NycWifiData.json'

wifi_json_file = File.open(seed_data_filename, 'rb')
wifi_json_obj = JSON.parse(wifi_json_file.read)

wifi_sites_array = wifi_json_obj["data"]

wifi_sites_array.each do |wifi_site|
	Site.create(
		:name 		=> wifi_site[name_idx],
		:address 	=> wifi_site[address_idx],
		:city 		=> wifi_site[city_idx],
		:phone 		=> wifi_site[phone_num_idx],
		:cost 		=> wifi_site[cost_idx],
		:zipcode  	=> wifi_site[postal_code_idx]
	)		
end

