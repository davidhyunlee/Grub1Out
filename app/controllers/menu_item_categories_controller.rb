class MenuItemCategoriesController < ApplicationController

  def create
    # render plain: params
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:menu_id])
    @category = @menu.menu_item_categories.new(category_params)

    if @category.save
      redirect_to edit_business_menu_path(@business, @menu)
    else
      render plain: "didn't work"
    end
  end

  private
    def category_params
      params.require(:menu_item_category).permit(:name)
    end
end
