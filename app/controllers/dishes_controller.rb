class DishesController < ApplicationController
  respond_to :json
  def index
    respond_with Dish.where(restaurant_id: params[:restaurant_id])
  end

  def create
    dish = Dish.new(name: params["name"], restaurant_id: params["restaurant_id"])
    dish.save
    render json: {}, status: 201
  end
end
