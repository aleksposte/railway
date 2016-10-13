class RailwayStation < ActiveRecord::Base
  
  validates :title, presence: true
  
  # Много routes, связь через таблицу :railway_stations_routes
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  # Много trains
  has_many :trains
end
