require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  describe "#index" do
    it "is successful" do
      get :index, format: :json
      expect(response.status).to eql(200)
    end
    it "has a name" do
      Restaurant.new(name: "test_restaurant")
      get :index, format: :json
      expect(response.body).to eql({name: "test_restaurant"}.to_json)
    end
  end


end
