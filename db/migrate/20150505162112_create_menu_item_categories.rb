class CreateMenuItemCategories < ActiveRecord::Migration
  def change
    create_table :menu_item_categories do |t|
      t.string :name, null: false
      t.references :menu_item, index: true, foreign_key: true
      t.references :menu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
