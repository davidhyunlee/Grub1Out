class AddRestaurantNameToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :restaurant_name, :string
  end
end
