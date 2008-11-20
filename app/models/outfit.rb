class Outfit < ActiveRecord::Base

  acts_as_taggable

  acts_as_voteable
  
  has_many :photos
  belongs_to :user

  named_scope :descending, :order => "created_at DESC"

  
end

