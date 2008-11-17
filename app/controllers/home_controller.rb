class HomeController < ApplicationController

  def index
    @latest = Outfit.find(:all, :order => 'id DESC', :limit=>6) 
  end
  
end
