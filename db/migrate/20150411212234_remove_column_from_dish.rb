class RemoveColumnFromDish < ActiveRecord::Migration
  def change
    remove_column :dishes, :name, :string
  end
end
