class Outfit < ActiveRecord::Base

  acts_as_taggable
  acts_as_voteable
  
  has_many :photos
  belongs_to :user

#  named_scope :descending, :order => "created_at DESC"

#  these were for when i rolled my own acts as votable 

  # def vote_for
  #   self.likes = self.likes + 1
  # end
  # 
  # def vote_against
  #   self.dislikes = self.dislikes + 1
  # end
  # 
  # def style_rating
  #   return (self.likes - self.dislikes)
  # end
  # 
  # def total_votes
  #   return (self.likes + self.dislikes)
  # end
  
end

