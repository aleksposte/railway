class Route < ActiveRecord::Base
  validates :title, presence: true
  # Своя валидация на мин кол-во станций в маршруте
  validate :station_count
  # Много :railway_stations, связь через таблицу :railway_stations_routes
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

# Маршрут может иметь много train
  has_many :trains

# Устанавливаем значение перед валидацией
  before_validation :set_title

  protected

  def set_title
    self.title = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end


  def station_count
    if railway_stations.size < 2
      errors.add(:base, "У  маршрута должно быть минимум две станции!")
    end
  end

   def station_in_route(station_id)
    railway_stations_routes.where('railway_station_id = ? and route_id = ?', station_id, id).first
  end

end
