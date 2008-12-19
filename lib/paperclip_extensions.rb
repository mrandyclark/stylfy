# @outfit.outfit_photo.url(:original)

def add_new_thumbnail_size(last_outfit_id = 61, add_size_dimension = "75x75#")
  
  # loop old outfits 
  outfits = Outfit.find(:all, :conditions => ["id < ?", last_outfit_id])
  outfits.each do |outfit|

    # retrieve file bits from s3
    # outfit.outfit_photo.url(:original)
  
    # create this thumbnail
    @queued_for_write[name] = Thumbnail.make(@queued_for_write[:original], added_size_dimension, format, extra_options_for(name), @whiny_thumbnails)
                                             
    # save existing paperclip, which will flush the "queued for write" 
    outfit.outfit_photo.save
  end
                                           
end
