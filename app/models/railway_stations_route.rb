class RailwayStationsRoute < ActiveRecord::Base

  # Общая тавлица для :railway_station и :route
  belongs_to :railway_station
  belongs_to :route
end
