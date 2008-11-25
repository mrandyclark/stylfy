class RemoveAttachmentFuAddPaperclip < ActiveRecord::Migration
    def self.up
      add_column :outfits, :outfit_photo_file_name, :string
      add_column :outfits, :outfit_photo_content_type, :string
      add_column :outfits, :outfit_photo_file_size, :integer
      add_column :outfits, :outfit_photo_updated_at, :datetime
      add_column :outfits, :outfit_photo_created_at, :datetime
      drop_table :photos
    end

    def self.down
      remove_column :outfits, :outfit_photo_file_name
      remove_column :outfits, :outfit_photo_content_type
      remove_column :outfits, :outfit_photo_file_size
      remove_column :outfits, :outfit_photo_updated_at
      remove_column :outfits, :outfit_photo_created_at
      
      create_table :photos do |t|
        t.column :outfit_id,  :integer
        t.column :content_type, :string
        t.column :filename, :string    
        t.column :thumbnail, :string 
        t.column :size, :integer
        t.column :width, :integer
        t.column :height, :integer
      end
    end

end
