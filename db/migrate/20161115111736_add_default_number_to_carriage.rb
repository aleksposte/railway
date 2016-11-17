class AddDefaultNumberToCarriage < ActiveRecord::Migration
  def change
    change_table :carriages do |t|
      change_column_default :carriages, :number, 0
    end
  end
end
