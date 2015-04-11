class AddRestFKeyToDish < ActiveRecord::Migration
  def change
    add_column :restaurant, :dish_id
    add_column :dish, :restaurant_id
  end
end
