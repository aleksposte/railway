class AddStationNumberToRailwayStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :station_number, :integer
  end
end
