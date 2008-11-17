require "rmagick"

class Photo < ActiveRecord::Base

  has_attachment :content_type => :image, 
                   :storage => :s3, 
                   :processor => :rmagick,
                   :max_size => 1.megabytes,
                   :thumbnails => { :thumb => '150x150>' }

  validates_as_attachment

  belongs_to :user
  belongs_to :outfit
  
end
