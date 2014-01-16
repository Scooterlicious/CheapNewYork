class ChangeReviewsRatingColumnToDecimalFromInteger < ActiveRecord::Migration
  def up
  	change_column :reviews, :rating, :decimal
  end

  def down
  	change_column :reviews, :rating, :integer
  end
end
