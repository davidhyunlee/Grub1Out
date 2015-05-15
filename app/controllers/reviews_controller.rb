class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @business = Business.find(params[:business_id])
    @review = @business.reviews.new
  end

  def create
    @business = Business.find(params[:business_id])
    @review = @business.reviews.new(review_params)
    if @review.save
      redirect_to business_path(@business)
    else
      render business_path(@business)
    end
  end

  def edit
    @business = Business.find(params[:business_id])
    @review = @business.reviews.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to business_path
    else
      redirect_to business_path
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :title, :body)
  end


end
