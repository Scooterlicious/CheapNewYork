class AddYelpBooleanToSite < ActiveRecord::Migration
  def change
    add_column :sites, :yelp, :boolean, default: false
  end
end
