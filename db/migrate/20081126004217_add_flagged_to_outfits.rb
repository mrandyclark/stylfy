class AddFlaggedToOutfits < ActiveRecord::Migration
  def self.up
    add_column :outfits, :flagged, :boolean, :default => false
    add_column :outfits, :flagged_by, :integer
    remove_column :outfits, :outfit_photo_created_at
 
  end

  def self.down
    remove_column :outfits, :flagged
    remove_column :outfits, :flagged_by
    add_column :outfits, :outfit_photo_created_at, :datetime
  end
end
