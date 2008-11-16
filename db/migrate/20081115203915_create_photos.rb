class CreatePhotos < ActiveRecord::Migration
  
  def self.up
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

  def self.down
    drop_table :mugshots
  end
end
