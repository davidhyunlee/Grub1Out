class MenuItemsController < ApplicationController

  def index
  end

  def show
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:menu_id])
    @category = @menu.menu_item_categories.find(params[:menu_item_category_id])
    @item = @category.menu_items.find(params[:id])
    @photo = @item.menu_item_photos.new
  end

  def create
    # render plain: params
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:menu_id])
    @menu_item = MenuItem.new(menu_item_params)
    # @photo = MenuItemPhoto.new(params.require(:menu_item_photo).permit(:photo, :menu_item_id, :caption, :user_id))
    @menu_item.save
    redirect_to edit_business_menu_path(@business, @menu)
  end

  def update
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:menu_id])
    @category = @menu.menu_item_categories.find(params[:menu_item_category_id])
    @item = @category.menu_items.find(params[:id])

    if @item.update_attributes(menu_item_params)
      redirect_to edit_business_menu_path(@business, @menu)
    else
      redirect_to edit_business_menu_path(@business, @menu)
    end
  end

  private
    def menu_item_params
      params.require(:menu_item).permit(:name, :description, :price, :menu_id, :menu_item_category_id)
    end
end
