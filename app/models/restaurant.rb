class Restaurant < ActiveRecord::Base
  has_many :dishes, :foreign_key => "restaurant_id"
end
