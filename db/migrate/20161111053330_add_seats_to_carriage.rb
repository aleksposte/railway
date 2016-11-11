class AddSeatsToCarriage < ActiveRecord::Migration
  def change
    change_table :carriages do |t|
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :seat_seats
      t.string  :type
      
    end
  end
end
