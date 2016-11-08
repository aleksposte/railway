class Carriage < ActiveRecord::Base
  belongs_to :train

  CARRIAGE_TYPES = ['Coupe', 'Econom']

  def self.type_carriage
    CARRIAGE_TYPES
  end

end
