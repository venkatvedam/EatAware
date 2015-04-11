class AddColumnToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :ingredients, :string
  end
end
