class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :country_code, :postal_code, :state_code, :phone, :rating, :about
  has_many :menus

end
