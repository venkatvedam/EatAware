require 'rails_helper'

RSpec.describe DishesController, type: :controller do

  it "filters by restaurant" do
    rest = Restaurant.new(name:"ttest")
    test_dish = Dish.new(dish: "test_dish", restaurant_id: 1, vegan: true, non_gmo: true)
    second_dish = Dish.new(dish: "second_dish", restaurant_id: 2, vegan: false, non_gmo: false)
    test_dish.save
    second_dish.save
    get :index, restaurant_id: 1, vegan: true, format: :json
    expect(response.body).to eql ([test_dish].to_json)
  end

  it "filters by vegan" do
    quinoa_salad = Dish.new(dish: "quinoa salad", restaurant_id: 1, ingredients: "quinoa", vegan: true, dairy_free: true, gluten_free: true, nut_free: true, organic: true, shell_fish: false, non_gmo: true, restaurant: "Sweetgreen", category: "Salad")
    blt = Dish.new(dish: "BLT", restaurant_id: 1, ingredients: "bacon", vegan: false, dairy_free: true, gluten_free: false, nut_free: true, organic: true, shell_fish: false, non_gmo: true, restaurant: "Flour", category: "Sandwich")
    quinoa_salad.save
    blt.save
    get :index, restaurant_id: 1, vegan: true, format: :json
    expect(response.body).to eql ([quinoa_salad].to_json)
  end

  it "creates a dish" do
    params = [{restaurant_id: 1, dish: "Sandwich"}]
    post :create, dishes: params.to_json, format: :json
    expect(response.status).to be(201)
    expect(Dish.count).to eql (1)
  end

  it "creates a vegan dish" do
    falafel = Dish.new(restaurant_id: 1, dish: "Falafel", vegan: true)
    falafel.save
    expect(falafel.vegan).to eql (true)
  end

  it "creates many dishes from a list" do
    post_body = [{
      restaurant_id: 1,
      category: "test_category",
      dish: "test_dish",
      ingredients: "test_ingredient",
      vegan: "y",
      dairy_free: "y",
      gluten_free: "y",
      nut_free: "y",
      organic: "y",
      shell_fish: "n",
      non_gmo: "y"
  },  
  {
      restaurant_id: 2,
      category: "test_category_2",
      dish: "test_dish_2",
      ingredients: "test_ingredient_2",
      vegan: "y",
      dairy_free: "y",
      gluten_free: "y",
      nut_free: "y",
      organic: "y",
      shell_fish: "n",
      non_gmo: "y"
  },  
  {
      restaurant_id: 1,
      category: "test_category_3",
      dish: "test_dish_3",
      ingredients: "test_ingredient_3",
      vegan: "y",
      dairy_free: "y",
      gluten_free: "y",
      nut_free: "y",
      organic: "y",
      shell_fish: "n",
      non_gmo: "y"
  }]
    post :create, dishes: post_body.to_json, format: :json
    expect(response.status).to be(201)
    expect(Dish.count).to eql (3)
  end

end
