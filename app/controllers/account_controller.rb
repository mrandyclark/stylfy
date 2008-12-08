class AccountController < ApplicationController

  def profile
    @user = User.find(:first, :conditions => ["login = ?", params[:login]])
  end


end
