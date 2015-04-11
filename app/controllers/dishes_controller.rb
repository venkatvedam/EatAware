class DishesController < ApplicationController
  respond_to :json
  def index
    @dishes = Dish.where(restaurant_id: params[:restaurant_id])
    respond_to do |format|
      format.json {render json: Dish.where(restaurant_id: params[:restaurant_id])}
      format.html {render}
    end
  end

  def create
    dish = Dish.new(
      dish: JSON.parse(params["dish"])["dish"], 
      restaurant_id: JSON.parse(params["dish"])["restaurant_id"]
    )
    dish.save
    render json: {}, status: 201
  end
end
