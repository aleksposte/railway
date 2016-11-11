class Carriage < ActiveRecord::Base
  
  belongs_to :train

  # Установка номаера вагона перед валидацией
  before_validation  :set_carriage_number
  validates :number, :top_seats, :bottom_seats, :train_id, presence: true
  #Проверка на уникальность номера вагона
  validates :number, uniqueness: { scope: :train_id }

  CARRIAGE_TYPES = ['Coupe', 'Econom', 'SV', 'Seating']

  def self.type_carriage
    CARRIAGE_TYPES
  end


protected
  def set_carriage_number
    carriage_max_number = train.carriages.maximum(:number)
    carriage_max_number = 0 if carriage_max_number.nil?
    self.number = carriage_max_number + 1
  end

end
