class Carriage < ActiveRecord::Base
  belongs_to :train

  CARRIAGE_TYPES = ['Coupe', 'Seating']

  def self.type_carriage
    CARRIAGE_TYPES
  end

end
