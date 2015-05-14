class MenuItemSerializer < ActiveModel::Serializer
  attributes :name, :description, :price
  has_many :menu_item_photos
end
