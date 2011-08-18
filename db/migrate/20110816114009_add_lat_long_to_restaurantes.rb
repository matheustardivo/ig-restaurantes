class AddLatLongToRestaurantes < ActiveRecord::Migration
  def self.up
    add_column :restaurantes, :latitude, :float
    add_column :restaurantes, :longitude, :float
  end

  def self.down
    remove_column :restaurantes, :latitude
    remove_column :restaurantes, :longitude
  end
end
