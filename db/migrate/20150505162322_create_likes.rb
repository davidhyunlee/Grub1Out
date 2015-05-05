class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true, foreign_key: true
      t.string :comment
      t.boolean :status
      t.references :menu_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
