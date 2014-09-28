class AddLatitudeToBus < ActiveRecord::Migration
  def change
    add_column :buses, :latitude, :float
    add_column :buses, :longitude, :float
  end
end
