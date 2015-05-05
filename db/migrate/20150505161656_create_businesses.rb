class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :address_2
      t.string :city
      t.string :country_code
      t.string :cross_streets
      t.string :postal_code
      t.string :state_code
      t.string :phone
      t.integer :rating
      t.string :about

      t.timestamps null: false
    end
  end
end
