class AccountController < ApplicationController

  def profile
    @user = User.find(:first, :conditions => ["login = ?", params[:login]])
  end

  def follow_user
    @follower = Follower.new
    @follower.user_id = User.find(params[:user]).id
    @follower.follows_user_id = User.find(params[:following]).id
    if @follower.save
      logger.info "!!!!!!!!!!!!!!!!!!!! #{ @follower.id }"
    end
    
  end
  

end
