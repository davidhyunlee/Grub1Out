class MenuItemPhoto < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :user
  mount_uploader :photo, MenuphotoUploader
end
