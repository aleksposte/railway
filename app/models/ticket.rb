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

  after_create :send_notification
  after_destroy :cancel_notification

  private

  # Отправка письма о покупке
  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end
  # Отправка письма об отмене
  def cancel_notification
    TicketsMailer.cancel_ticket(self).deliver_now
  end

end



  