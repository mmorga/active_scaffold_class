class Album < ActiveRecord::Base
  has_many :album_artists
  has_many :artists, :through => :album_artists
  
  composed_of :price, :class_name => "Money", 
      :mapping => [%w(price_in_cents cents), %w(currency currency)],
      :converter => Proc.new {|value| value.to_money}
end
