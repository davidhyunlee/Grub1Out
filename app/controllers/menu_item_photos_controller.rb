class MenuItemPhotosController < ApplicationController
  def create
  end

  private
    def menu_item_photo_params
      params.require(:menu_item_photo).permit(:photo, :caption, :user_id, :menu_item_id)
    end
end
