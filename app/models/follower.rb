class Follower < ActiveRecord::Base

  belongs_to :users
  has_one :user, :class_name => "Follows User"
  
end
