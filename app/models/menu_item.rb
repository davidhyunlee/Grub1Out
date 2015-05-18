class MenuItem < ActiveRecord::Base
  has_one :menu, through: :menu_item_category
  belongs_to :menu_item_category
  has_many :likes
  has_many :users, through: :likes
  has_many :menu_item_photos
  has_many :users, through: :menu_item_photos

  fuzzily_searchable :name
end
