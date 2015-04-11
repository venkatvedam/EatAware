require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  describe "#index" do
    it "is successful" do
      get :index, format: :json
      expect(response.status).to eql(200)
    end
    it "has a name" do
      test_restaurant = Restaurant.new(name: "test_restaurant")
      expect(Restaurant).to receive(:all).and_return(test_restaurant)
      get :index, format: :json
      expect(response.body).to eql(test_restaurant.to_json)
    end
  end


end
