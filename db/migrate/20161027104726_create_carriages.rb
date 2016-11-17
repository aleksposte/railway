class CreateCarriages < ActiveRecord::Migration
  def change
    create_table :carriages do |t|
      t.integer :number
      t.string  :type_carriage
      t.integer :top_seats
      t.integer :bottom_seats
      t.integer :train_id

      t.timestamps null: false
    end
  end
end
