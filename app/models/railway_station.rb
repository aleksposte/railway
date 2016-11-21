class RailwayStation < ActiveRecord::Base
  
  validates :title, presence: true
  
  # Много routes, связь через таблицу :railway_stations_routes
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  # Много trains
  has_many :trains, class_name: 'Train', foreign_key: :current_station_id

  # default_scope { order(:station_number) }

  # Сортировка станций по номеру
  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.position').uniq }

# Изменение позиции станции в маршруте, времени прибытия и отправления:    
  def update_position(route, position, arrival_time, departure_time)
    station_route = station_route(route)
    station_route.update(position: position, arrival_time: arrival_time, departure_time: departure_time) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def update_time
    
  end

  # Время прибытия и отправления
  def arrival_time(route)
    railway_stations_routes.where(route: route).first.arrival_time
  end

  def departure_time(route)
    railway_stations_routes.where(route: route).first.departure_time
  end

protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end



