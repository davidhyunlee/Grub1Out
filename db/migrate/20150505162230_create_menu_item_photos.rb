class CreateMenuItemPhotos < ActiveRecord::Migration
  def change
    create_table :menu_item_photos do |t|
      t.string :photo, null: false
      t.references :menu_item, index: true, foreign_key: true
      t.string :caption
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
