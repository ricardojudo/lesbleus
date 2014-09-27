class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :name
      t.string :bid
      t.integer :route_id

      t.timestamps
    end
  end
end
