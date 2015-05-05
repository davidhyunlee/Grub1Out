class MenuItemCategory < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :menu
end
