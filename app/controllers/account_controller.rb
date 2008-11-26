class AccountController < ApplicationController

  before_filter :login_required, :except => "profile"

  def index
  end
  
  def profile
    @account = User.find(:first, :conditions => ["login = ?", params[:account_name]])
  end
  

end
