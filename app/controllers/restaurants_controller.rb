class RestaurantsController < ApplicationController
  respond_to :json
  def index
    respond_with Restaurant.all
  end

  def create
    restaurant = Restaurant.new(name: params["name"]) 
    restaurant.save
    render json: {}, status: 201
  end
end
