class AddMenuItemCategoryIdToMenuItems < ActiveRecord::Migration
  def change
    add_reference :menu_items, :menu_item_category, index: true, foreign_key: true
  end
end
