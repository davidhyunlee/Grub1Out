class MenuItemCategorySerializer < ActiveModel::Serializer
  attributes :name
  has_many :menu_items
end
