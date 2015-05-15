class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu_item
  validates_uniqueness_of :user, scope: :menu_item
end
