class HomeController < ApplicationController

  def index
    
    if !current_subdomain.nil?
      redirect_to :controller => "profile", :account_name => current_subdomain
    end
      
  end
  
  
end
