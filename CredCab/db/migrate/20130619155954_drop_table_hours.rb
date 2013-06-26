class DropTableHours < ActiveRecord::Migration
  def change
  	drop_table :hours
  end
end
