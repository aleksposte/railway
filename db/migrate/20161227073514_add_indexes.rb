class AddIndexes < ActiveRecord::Migration
  def change
    add_index :railway_stations_routes, [:railway_station_id, :route_id], unique: true, name: 'pair_unique'
    add_index :carriages, [:id, :type]
  end
end
