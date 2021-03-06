class TagsController < ApplicationController

  def index
    @tags = Outfit.tag_counts(:order_by => "name")   
  end
  
  def show
    @tag = params[:tag_name]
    @outfits = Outfit.find_tagged_with(params[:tag_name]) 
  end

end
