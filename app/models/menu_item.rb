class MenuItem < ActiveRecord::Base
  belongs_to :menu
  has_many :likes
  has_many :users, through: :likes
  has_many :menu_item_photos
  has_many :users, through: :menu_item_photos
  has_one :menu_item_categories
end
