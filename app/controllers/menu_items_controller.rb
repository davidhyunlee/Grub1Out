class MenuItemsController < ApplicationController

  def index
  end

  def create
    # render plain: params
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:menu_id])
    @menu_item = MenuItem.new(menu_item_params)
    @menu_item.save
    redirect_to edit_business_menu_path(@business, @menu)
  end

  private
    def menu_item_params
      params.require(:menu_item).permit(:name, :description, :price, :menu_id, :menu_item_category_id)
    end
end
