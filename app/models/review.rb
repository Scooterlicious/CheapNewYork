class Review < ActiveRecord::Base
  attr_accessible :rating, :written_text
  belongs_to :site
  belongs_to :user
end
