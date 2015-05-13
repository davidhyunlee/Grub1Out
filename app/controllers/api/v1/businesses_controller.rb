class API::V1::BusinessesController < ApplicationController
  respond_to :json

  def index
    render json: Business.all
  end

  def show
  end

end