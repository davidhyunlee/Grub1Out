class MenuSerializer < ActiveModel::Serializer
  attributes :id, :name, :restaurant_name

  def restaurant_name
    return Business.find(:id)
  end

end
