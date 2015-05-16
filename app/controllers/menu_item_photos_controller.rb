class MenuItemPhotosController < ApplicationController
  def new
  end

  def create
    # render plain: params
    @photo = MenuItemPhoto.new(menu_item_photo_params)
    if @photo.save
      redirect_to '/'
    else
      redirect_to '/businesses'
    end
  end

  private
    def menu_item_photo_params
      params.require(:menu_item_photo).permit(:photo, :caption, :user_id, :menu_item_id)
    end
end
