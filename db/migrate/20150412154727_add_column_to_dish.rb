class AddColumnToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :restaurant, :string
    add_column :dishes, :category, :string
    add_column :dishes, :dish, :string
    add_column :dishes, :ingredients, :string
    add_column :dishes, :vegan, :boolean
    add_column :dishes, :dairy_free, :boolean
    add_column :dishes, :gluten_free, :boolean
    add_column :dishes, :nut_free, :boolean
    add_column :dishes, :organic, :boolean
    add_column :dishes, :shell_fish, :boolean
    add_column :dishes, :non_gmo, :boolean
  end
end
