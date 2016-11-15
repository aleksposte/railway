class RailwayStation < ActiveRecord::Base
  
  validates :title, presence: true
  
  # Много routes, связь через таблицу :railway_stations_routes
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  # Много trains
  has_many :trains, class_name: 'Train', foreign_key: :current_station_id

  # default_scope { order(:station_number) }

  # Сортировка станций по номеру
  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_number').distinct }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(station_number: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:station_number)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end



