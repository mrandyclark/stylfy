class AddFeaturedItems < ActiveRecord::Migration
  def self.up
    add_column  :outfits, :featured, :boolean, :default => false
    add_column  :tags, :featured, :boolean, :default => false  
  end
  

  def self.down
    remove_column :outfits, :featured
    remove_column :tags, :featured
  end
end
