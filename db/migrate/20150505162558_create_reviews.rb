class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.references :business, index: true, foreign_key: true
      t.string :body, null: false
      t.string :title
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
