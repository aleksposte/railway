class Train < ActiveRecord::Base
  
  # Принадлежит route
  belongs_to :route

  # Принадлежит railway_station
  # belongs_to :railway_station

  # Принадлежит railway_station, переделано в current_station + указание RailwayStation
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  # Имеет много tickets
  has_many :tickets

  has_many :carriages

  def carriage_list
    # Carriage.where(train_id: self.id).order(number: self.sort_order ? :asc : :desc)
    carriages.order(number: self.sort_order ? :asc : :desc)
  end
  
end
