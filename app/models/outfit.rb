class Outfit < ActiveRecord::Base

  acts_as_taggable
  acts_as_commentable
  acts_as_voteable
  
  belongs_to :user

  named_scope :descending, :order => "created_at DESC"

  has_attached_file :outfit_photo,
                    :styles => { :large => "640x640>",
                                 :medium => "300x300>",
                                 :square => "150x150#" },
                    :path => ":attachment/:id/:style.:extension",
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml"
                    
                    
                    
  attr_protected :outfit_photo_file_name, :outfit_photo_content_type, :outfit_photo_size

  validates_attachment_presence :outfit_photo
  validates_attachment_size :outfit_photo, :less_than => 1.megabytes
  validates_attachment_content_type :outfit_photo, :content_type => ['image/jpeg', 'image/png']
  
  def self.latest_outfits(x)
    Outfit.find(:all, :order => 'id DESC', :limit => x, :conditions => "flagged = false" ) 
  end
  
  def style_rating
    if self.votes.length > 0
  	  return "Style Rating: #{ ((self.votes_for.to_f / self.votes.length.to_f) * 100).to_i }% (#{self.votes.length} votes)"
	  else
	    return "There are no votes for this outfit yet."
	  end
	  
  end
  
  
end

