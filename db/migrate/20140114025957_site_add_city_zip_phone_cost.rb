class SiteAddCityZipPhoneCost < ActiveRecord::Migration
  def up
  	add_column :sites, :cost, :string
  	add_column :sites, :phone, :string
  	add_column :sites, :city, :string
  end

  def down
  	remove_column :sites, :cost
  	remove_column :sites, :phone
  	remove_column :sites, :city
  end
end
