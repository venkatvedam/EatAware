class DishesController < ApplicationController
  respond_to :json
  def index
   @dishes = Dish.where(
     params.slice(
       :dish,
       :restaurant_id,
       :ingredients,
       :vegan,
       :dairy_free,
       :gluten_free,
       :nut_free,
       :organic,
       :shell_fish,
       :non_gmo,
       :restaurant,
       :category
    ))
    respond_to do |format|
      format.json {
        render json: @dishes
      }
      format.html {
        render
      }
    end
  end

  def create
    dishes = JSON.parse(params["dishes"])
    dishes.each { |dish|
      dish = Dish.new(
        dish: dish["dish"],
        restaurant_id: dish["restaurant_id"],
        ingredients: dish["ingredients"],
        vegan: dish["vegan"],
        dairy_free: dish["dairy_free"],
        gluten_free: dish["gluten_free"],
        nut_free: dish["nut_free"],
        organic: dish["organic"],
        shell_fish: dish["shell_fish"],
        non_gmo: dish["non_gmo"],
        restaurant: dish["restaurant"],
        category: dish["category"]
      )
      dish.save
    }
    render json: {}, status: 201
  end
end
