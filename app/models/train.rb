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

  
  def carr_by_type
    c_type = {}
    Carriage.type_carriage.each do |type|
      c_type[type] = 0
      self.carriages.each do |c|
        if c.type_carriage == type.to_s
          c_type[type] += 1
        end
      end
    end
    return c_type
  end

  def places_by_type (type_carriage)
    c_type = {
              "Верхние места" => 0, 
              "Нижние места" => 0
              }

    self.carriages.each do |c|
      if c.type_carriage == type_carriage
        if c.top_seats.present?
          c_type["Верхние места"] += c.top_seats
        end
          c_type["Нижние места"]  += c.bottom_seats unless c.bottom_seats.nil?
      end
    end
    return c_type
  end

   def carriage_list
    carriages.order(number: self.sort_order ? :asc : :desc)
  end

end
