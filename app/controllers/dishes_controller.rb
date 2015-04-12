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
      restaurant_id: JSON.parse(params["dish"])["restaurant_id"],
      ingredients: JSON.parse(params["dish"])["ingredients"],
      vegan: JSON.parse(params["dish"])["vegan"],
      dairy_free: JSON.parse(params["dish"])["dairy_free"],
      gluten_free: JSON.parse(params["dish"])["gluten_free"],
      nut_free: JSON.parse(params["dish"])["nut_free"],
      organic: JSON.parse(params["dish"])["organic"],
      shell_fish: JSON.parse(params["dish"])["shell_fish"],
      non_gmo: JSON.parse(params["dish"])["non_gmo"],
      restaurant: JSON.parse(params["dish"])["restaurant"],
      category: JSON.parse(params["dish"])["category"]
    )
    dish.save
    render json: {}, status: 201
  end
end
