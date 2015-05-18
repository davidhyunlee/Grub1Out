class MenuItemPhotosController < ApplicationController
  def new
  end

  def create
    # render plain: params
    @business = Business.find(params[:business_id])
    @menu = Menu.find(params[:menu_id])
    @photo = MenuItemPhoto.new(menu_item_photo_params)
    if @photo.save
      redirect_to business_menu_path(@business, @menu)
    else
      redirect_to edit_business_menu_path(@business, @menu)
    end
  end

  private
    def menu_item_photo_params
      params.require(:menu_item_photo).permit(:photo, :caption, :user_id, :menu_item_id)
    end
end
