class ReviewsController < ApplicationController

  # shows reviews
  def index
    @reviews = Review.all
  end

  # creates new reviews through the business parameters
  def new
    @business = Business.find(params[:business_id])
    @review = @business.reviews.new
  end

  # creates new business reviews. First must find business through business ID.
  # review is then saved and redirected to business_path
  def create
    @business = Business.find(params[:business_id])
    @review = @business.reviews.new(review_params)
    if @review.save
      redirect_to business_path(@business)
    else
      render business_path(@business)
    end
  end

  # edits the business reviews by finding business first
  def edit
    @business = Business.find(params[:business_id])
    @review = @business.reviews.find(params[:id])
  end

# updates reviews
  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to business_path
    else
      redirect_to business_path
    end
  end
# shows review by id
  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :title, :body)
  end


end
