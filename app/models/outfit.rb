class Outfit < ActiveRecord::Base

  acts_as_taggable
    
  has_many :photos
  belongs_to :user


  def vote_for
    self.likes = self.likes + 1
  end
  
  def vote_against
    self.dislikes = self.dislikes + 1
  end
  
  def style_rating
    return (self.likes - self.dislikes)
  end
  
end
