# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

count = Cordinate.count
(count..50000).each do | i |
  lat = Kernel.rand(Cordinate::SOUTH_EDGE..Cordinate::NORTH_EDGE)
  lng = Kernel.rand(Cordinate::WEST_EDGE..Cordinate::EAST_EDGE)
  Cordinate.create!(
  	latitude: lat,
  	longitude: lng,
  	quadkey15: Quadkey.encode(lat, lng, 15),
  	quadkey22: Quadkey.encode(lat, lng, 22)
  )
  print '.'
end
