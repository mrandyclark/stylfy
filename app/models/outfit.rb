class Outfit < ActiveRecord::Base

  acts_as_taggable
    
  has_many :photos
  belongs_to :user
  
end
