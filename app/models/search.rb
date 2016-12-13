class Search

  include ActiveModel::Model

  attr_accessor :start_station_id, :end_station_id, :railway_stations_both
  attr_reader :result

  validates :start_station_id, :end_station_id, presence: true

  def start_station
    @start_station ||= RailwayStation.find(start_station_id)
  end

  def end_station
    @end_station ||= RailwayStation.find(end_station_id)
  end

  def run
    if valid?
      # Разобраться с запросами , синтаксисом
      # @railway_stations_both = RailwayStation.includes(:start_station_id, :end_station_id)
      # @result = Route.includes(:trains).where(Train.includes(:start_station_id, :end_station_id) 
      # @result = Train.includes(route: :railway_stations).where(railway_stations: {id: start_station_id} & {id: end_station_id})
      @result = Train.includes(route: :railway_stations).where(railway_stations: {id: start_station_id}) &
                Train.includes(route: :railway_stations).where(railway_stations: {id: end_station_id})
    end
  end

end


