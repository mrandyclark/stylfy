class Photo < ActiveRecord::Base

  has_attachment  :content_type => :image, 
                  :storage => :s3, 
                  :max_size => 1.megabytes,
                  :thumbnails => { :thumbnail => '100x100>' }
                 
  validates_as_attachment

#  validates_presence_of :photo
  
  belongs_to :user
  belongs_to :outfit
  
end
