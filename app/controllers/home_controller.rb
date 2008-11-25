class HomeController < ApplicationController

  def index
    @latest = Outfit.find(:all, :order => 'id DESC', :limit => 3 ) 
  end
  
end
