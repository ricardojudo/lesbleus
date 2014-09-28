class AddPassengersToUsers < ActiveRecord::Migration
  def change
    add_column :buses, :passengers, :integer, default: 0
  end
end
