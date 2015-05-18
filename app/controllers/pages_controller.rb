class PagesController < ApplicationController
  def index
    @items = MenuItem.all
    @businesses = Business.all
  end
end
