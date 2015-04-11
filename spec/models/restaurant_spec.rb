require 'rails_helper'
RSpec.describe Restaurant, type: :model do
  it "has a name" do
    test_restaurant = Restaurant.new(name: "test_restaurant")
    expect(test_restaurant.name).to eql("test_restaurant")
  end

  it { should have_many(:dishes) }
end
