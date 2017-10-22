class Cordinate < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  SAITAMA_KENCHO = { lat: 35.8569444, lng: 139.6488889 }
  NORTH_EDGE=36.2833376
  EAST_EDGE=139.8652589
  SOUTH_EDGE=35.7536154
  WEST_EDGE=138.7092002

  PRECISION_PAIR = { 11 => 9.5, 12 => 4.5, 13 => 2, 14 => 1, 15 => 0.5, 16 => 0.3, 17 => 0.15 }

  scope :quadKey, lambda { | lat, lng, precision |
  	q = Quadkey.encode(lat, lng, precision)
  	where("quadKey22 like ?", "#{q}%")
  }

  def self.boundary(quadKey)
  	top_left = Quadkey.decode(quadKey)
  	neighbors = Quadkey.neighbors(quadKey)
  	
  	top = top_left[0]
  	left = top_left[1]
  	right = Quadkey.decode(neighbors[5])[1]
  	bottom = Quadkey.decode(neighbors[7])[0]
  	return { top: top, bottom: bottom, left: left, right: right }
  end

  def enc_quadkey(precision)
	Quadkey.encode(self.latitude, self.longitude, precision)
  end

  def self.random_near
  	@@counter ||= 0
  	val = PRECISION_PAIR.values[@@counter % PRECISION_PAIR.keys.count]
    Cordinate.near(random_cordinate, val)
  end

  def self.random_quakey
  	@@counter ||= 0
  	val = PRECISION_PAIR.keys[@@counter % PRECISION_PAIR.keys.count]
    Cordinate.quadKey(*random_cordinate, val)
  end

  private
  def self.random_cordinate
    lat = Kernel.rand(Cordinate::SOUTH_EDGE..Cordinate::NORTH_EDGE)
    lng = Kernel.rand(Cordinate::WEST_EDGE..Cordinate::EAST_EDGE)
    return lat, lng
  end
end
