class CreateOutfits < ActiveRecord::Migration
  def self.up
    create_table :outfits do |t|
      t.integer :user_id
      t.string :description
      t.integer :likes, :default => 0
      t.integer :dislikes, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :outfits
  end
end
