class Dish < ActiveRecord::Base
  attr_accessible :restaurant_id
  attr_accessible :non_gmo
  attr_accessible :dairy_free
  attr_accessible :dish
  attr_accessible :ingredients
  attr_accessible :gluten_free
  attr_accessible :nut_free
  attr_accessible :organic
  attr_accessible :shell_fish
  attr_accessible :restaurant
  attr_accessible :category
  attr_accessible :vegan
end
