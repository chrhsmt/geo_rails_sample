class CreateCordinates < ActiveRecord::Migration
  def change
    create_table :cordinates do |t|
      t.float :latitude
      t.float :longitude
      t.string :quadkey15
      t.string :quadkey22

      t.timestamps null: false
    end
    add_index :cordinates, :latitude
    add_index :cordinates, :longitude
    add_index :cordinates, :quadkey15
    add_index :cordinates, :quadkey22
  end
end
