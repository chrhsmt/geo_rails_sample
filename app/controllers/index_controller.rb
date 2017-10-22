class IndexController < ApplicationController
  def index
    @kencho = Cordinate::SAITAMA_KENCHO
    @boundary = Cordinate.boundary(Quadkey.encode(@kencho[:lat], @kencho[:lng], 15))
    @radius = 0.5 #km

    @qkeys = Cordinate.quadKey(@kencho[:lat], @kencho[:lng], 15)
    @geocodes = Cordinate.near([@kencho[:lat], @kencho[:lng]], @radius)
  end

  def random_near
  	Cordinate.random_near.length
  	render nothing: true
  end

  def random_quakey
  	Cordinate.random_quakey.length
  	render nothing: true
  end
end
