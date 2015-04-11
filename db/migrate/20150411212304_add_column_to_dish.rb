class AddColumnToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :dish, :string
    add_column :dishes, :category, :string
  end
end
