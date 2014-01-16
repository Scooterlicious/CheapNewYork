class ChangeStringToTextInReviews < ActiveRecord::Migration
 	def self.up
		change_column :reviews, :written_text, :text
	end

	def self.down
		change_column :reviews, :written_text, :string
	end
end
