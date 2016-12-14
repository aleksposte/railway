class Ticket < ActiveRecord::Base
  
  # Принадлежит user
  belongs_to :user

  # Принадлежит route
  # belongs_to :route

  # Принадлежит start_ststion. end_station
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station,   class_name: 'RailwayStation', foreign_key: :end_station_id
  
  # Принадлежит train
  belongs_to :train
 
  # Валидайии для проверки имени пассажира, паспорта
  validates :passenger_name, :passport_number, presence: true

end


  