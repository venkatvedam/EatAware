class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end
