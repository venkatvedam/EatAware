class AddColumnToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :info, :string
    add_column :restaurants, :location, :string
    add_column :restaurants, :url, :string
  end
end
