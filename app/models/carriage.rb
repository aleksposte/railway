class Carriage < ActiveRecord::Base
  belongs_to :train

  validates :number, :top_seats, :bottom_seats, :train_id, presence: true

  CARRIAGE_TYPES = ['Coupe', 'Econom']

  def self.type_carriage
    CARRIAGE_TYPES
  end

end
