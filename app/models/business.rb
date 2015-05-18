class Business < ActiveRecord::Base
    has_many :menus, dependent: :destroy
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :tags
    has_many :reviews, dependent: :destroy
    has_many :business_photos, dependent: :destroy
    has_and_belongs_to_many :users

    fuzzily_searchable :name
end
