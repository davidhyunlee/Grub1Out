class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.references :menu, index: true, foreign_key: true
      t.string :name, null: false
      t.string :description
      t.float :price
      t.integer :likes

      t.timestamps null: false
    end
  end
end
