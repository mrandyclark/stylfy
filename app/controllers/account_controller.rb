class AccountController < ApplicationController

  before_filter :login_required, :except => "profile"

  def index
  end
  
  def profile
    @user = User.find(:first, :conditions => ["login = ?", params[:login]])
  end


end
