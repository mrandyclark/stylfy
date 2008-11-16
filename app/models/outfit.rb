class Outfit < ActiveRecord::Base

  has_many :photos
  belongs_to :user
  
end
