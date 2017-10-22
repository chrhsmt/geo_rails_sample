class AddMultipleIndexToCordinate < ActiveRecord::Migration
  def change
  	add_index :cordinates, [:latitude, :longitude]
  end
end
