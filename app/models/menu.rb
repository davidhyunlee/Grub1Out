class Menu < ActiveRecord::Base
  belongs_to :business
  has_many :menu_item_categories
  has_many :menu_items, through: :menu_item_categories

end
