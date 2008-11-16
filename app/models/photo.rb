class Photo < ActiveRecord::Base

  has_attachment :content_type => :image, 
                   :storage => :file_system, 
                   :max_size => 1.megabyte,
                   :thumbnails => { :thumb => '150x150>' }

  validates_as_attachment

  belongs_to :user
  belongs_to :outfit
  
end
