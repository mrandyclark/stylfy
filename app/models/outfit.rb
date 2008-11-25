class Outfit < ActiveRecord::Base

  acts_as_taggable

  acts_as_voteable
  
  belongs_to :user

  named_scope :descending, :order => "created_at DESC"

  has_attached_file :outfit_photo,
    :styles => { :tiny => "35x35", :preview => "175x175", :large => "300x300" }, 
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => ":attachment/:id/:style.:extension",
    :bucket => 'stylfy_development'

  
end

