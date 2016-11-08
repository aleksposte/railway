class Carriage < ActiveRecord::Base
  belongs_to :train

  validates :number, presence:  true
  validates :top_seats, presence:  true
  validates :bottom_seats, presence:  true
  validates :train_id, presence:  true

  CARRIAGE_TYPES = ['Coupe', 'Econom']

  def self.type_carriage
    CARRIAGE_TYPES
  end

end
