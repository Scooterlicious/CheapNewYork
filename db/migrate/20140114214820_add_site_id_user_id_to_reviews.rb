class AddSiteIdUserIdToReviews < ActiveRecord::Migration
  def up
  	add_column :reviews, :site_id, :integer
  	add_column :reviews, :user_id, :integer
  end

  def down
  	remove_column :reviews, :site_id
  	remove_column :reviews, :user_id
  end
end
