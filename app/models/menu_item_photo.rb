class MenuItemPhoto < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :user
  mount_uploader :menu_item_photo, MenuphotoUploader
end
