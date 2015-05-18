class Api::V1::BusinessesController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def index
    businesses = Business.all
    render json: businesses, root: false
  end

  def show
    business = Business.find(params[:id])
    render json: business, root: false
  end


end