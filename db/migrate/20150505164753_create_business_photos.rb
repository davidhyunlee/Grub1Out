class CreateBusinessPhotos < ActiveRecord::Migration
  def change
    create_table :business_photos do |t|
      t.references :business, index: true, foreign_key: true
      t.string :photo, null: false
      t.string :caption
      t.references :user, index: true, foreign_key: true
      t.references :review, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
