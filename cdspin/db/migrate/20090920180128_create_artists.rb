class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
    
    create_table :album_artists do |t|
      t.references :artist
      t.references :album
      t.timestamps
    end
  end

  def self.down
    drop_table :album_artists
    drop_table :artists
  end
end
