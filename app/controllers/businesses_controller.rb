class BusinessesController < ApplicationController

# fuzzy search filters search by name and narrows it down if search query is similar
  def index
    if params[:filter] == "by_name"
      query = params[:query]
      @results = Business.find_by_fuzzy_name(query, :limit => 10)
    elsif params[:filter] == "by_item"
      query = params[:query]
      @results = MenuItem.find_by_fuzzy_name("#{query}")
    else
      @results = Business.order(:name)
    end
  end

# shows business and reviews for business show page
  def show
    # Google Maps API
    # url = "https://maps.googleapis.com/maps/api/js?key="
    # key = ENV['GOOGLE_MAPS']
    # @endpoint = url + key

    @business = Business.find(params[:id])
    @menus = @business.menus.all
    @reviews = @business.reviews.all
  end

  def edit
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

# creates new businesses
  def create
    @business = Business.new(business_params)
    if @business.save
        redirect_to business_path(@business)
    else
        render new
    end
  end

# updates business attributes
  def update
    @business = Business.find(params[:id])
    if @business.update_attributes(business_params)
        redirect_to business_path
    else
        render edit
    end
  end
  
# destroy method
  def destroy
    @business = Business.find(params[:id])
    @business.destroy
    redirect_to businesses_path
  end

  private
  def business_params
    params.require(:business).permit(:name, :address, :address_2, :city, :country_code, :postal_code, :state_code, :phone, :rating, :about)
  end

end
