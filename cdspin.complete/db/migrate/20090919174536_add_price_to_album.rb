class AddPriceToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :price_in_cents, :integer, :default => 0
    add_column :albums, :currency, :string, :default => "USD"
  end

  def self.down
    drop_column :albums, :price_in_cents
    drop_column :albums, :currency, :string
  end
end
