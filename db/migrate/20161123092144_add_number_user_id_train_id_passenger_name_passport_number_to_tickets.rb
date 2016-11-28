class AddNumberUserIdTrainIdPassengerNamePassportNumberToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :number,           :string
    add_column :tickets, :passenger_name,   :string
    add_column :tickets, :passport_number,  :string
    add_column :tickets, :user_id,          :integer
    add_column :tickets, :train_id,         :integer
  end
end
