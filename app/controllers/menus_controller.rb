class MenusController < ApplicationController

  def index
    @business = Business.find(params[:business_id])
    @menus = @business.menus.all
  end

  def new
    @business = Business.find(params[:business_id])
    @menu = @business.menus.new
  end

  def create
    @business = Business.find(params[:business_id])
    @menu = @business.menus.new(menu_params)
    if @menu.save
      redirect_to edit_business_menu_path(@business, @menu)
    else
      render new
    end
  end

  def show
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:id])
    @category = @menu.menu_item_categories.all
  end

  def edit
    @business = Business.find(params[:business_id])
    @menu = @business.menus.find(params[:id])
    @category = @menu.menu_item_categories.new(params[:name])
    @categories = @menu.menu_item_categories.all
    @menuitem = MenuItem.new

  end

  def update
    @menu
  end

  private
  def menu_params
    params.require(:menu).permit(:name)
  end

end