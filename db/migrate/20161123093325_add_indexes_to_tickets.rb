class AddIndexesToTickets < ActiveRecord::Migration
  def change
    add_index :tickets, :user_id
    add_index :tickets, [:start_station_id, :end_station_id]
  end
end
