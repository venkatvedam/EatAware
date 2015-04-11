require 'rails_helper'

RSpec.describe DishesController, type: :controller do

  it "filters by restaurant" do
    test_dish = Dish.new(dish: "test_dish", restaurant_id: 1)
    second_dish = Dish.new(dish: "second_dish", restaurant_id: 2)
    test_dish.save
    second_dish.save
    get :index, restaurant_id: 1, format: :json
    expect(response.body).to eql ([test_dish].to_json)
  end

  it "creates a dish" do
    params = {restaurant_id: 1, dish: "Sandwich"}
    post :create, dish: params.to_json, format: :json
    expect(response.status).to be(201)
    expect(Dish.count).to eql (1)
  end

  it "creates a vegan dish" do
    falafel = Dish.new(restaurant_id: 1, dish: "Falafel", vegan: true)
    falafel.save
    expect(falafel.vegan).to eql (true)
  end

end
