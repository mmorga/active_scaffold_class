class Artist < ActiveRecord::Base
  has_many :album_artists
  has_many :albums, :through => :album_artists
  
  def to_label
    "#{first_name} #{last_name}"
  end
end
