class Api::V1::MenusController < ApplicationController
  # has_many :menu_items
  protect_from_forgery with: :null_session

  def index
    menus = Menu.all
    render json: menus
  end

  def show

  end


end