class RestaurantsController < ApplicationController
  respond_to :json
  def index
    respond_with Restaurant.all
  end

  def create
  binding.pry
    restaurants = JSON.parse(params["restaurants"])
    restaurants.each { |restaurant|
      restaurant = Restaurant.new(
        name: params["name"],
        info: params["info"],
	location: params["location"],
	url: params["url"]
      )
      restaurant.save
    }
    render json: {}, status: 201
  end
end
