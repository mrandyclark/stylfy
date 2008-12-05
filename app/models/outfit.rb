class Outfit < ActiveRecord::Base

  acts_as_taggable
  acts_as_commentable
  acts_as_voteable
  
  belongs_to :user

  named_scope :descending, :order => "created_at DESC"

  has_attached_file :outfit_photo,
    :styles => { :square => "150x150#", :medium => "350x264>", :large => "640x480" }, 
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => ":attachment/:id/:style.:extension",
    :bucket => 'stylfy'

  attr_protected :outfit_photo_file_name, :outfit_photo_content_type, :outfit_photo_size

  validates_attachment_presence :outfit_photo
  validates_attachment_size :outfit_photo, :less_than => 1.megabytes
  validates_attachment_content_type :outfit_photo, :content_type => ['image/jpeg', 'image/png']
  
  def self.latest_outfits(x)
    Outfit.find(:all, :order => 'id DESC', :limit => x, :conditions => "flagged = false" ) 
  end
  
  
end

