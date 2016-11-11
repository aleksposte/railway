class RailwayStationsRoute < ActiveRecord::Base

  # Общая тавлица для :railway_station и :route
  belongs_to :railway_station
  belongs_to :route
  
  # В разных routes могут иметь разные номера
  validates :railway_station_id, uniqueness: { scope: :route_id }
end
