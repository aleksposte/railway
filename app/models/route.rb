class Route < ActiveRecord::Base
  validates :title, presence: true

  # Много :railway_stations, связь через таблицу :railway_stations_routes
  has_many :railway_stations
  has_many :railway_stations, through: :railway_stations_routes

# Маршрут может иметь много train
  has_many :trains
end
