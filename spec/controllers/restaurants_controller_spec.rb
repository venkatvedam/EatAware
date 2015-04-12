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

  it "creates a restaurant" do
    post :create, restaurants: {name: "Test"}.to_json, format: :json
    expect(response.status).to be(201)
    expect(Restaurant.count).to eql (1)
  end

  it "creates many restaurants from a list" do
    post_body = [{
      name: "test_restaurant",
      info: "test_info",
      location: "test_location",
      url: "test_url"
    }, {
      name: "test_restaurant2",
      info: "test_info2",
      location: "test_location2",
      url: "test_url2"
    }]
    post :create, restaurants: post_body.to_json, format: :json
    expect(response.status).to be(201)
    expect(Restaurant.count).to eql (2)
  end

end
