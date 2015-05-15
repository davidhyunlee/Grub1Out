class Business < ActiveRecord::Base
    has_many :menus
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :tags
    has_many :reviews, dependent: :destroy
    has_many :business_photos
    has_and_belongs_to_many :users

    geocoded_by :address
    after_validation :geocode

end
