class ReviewsController < ApplicationController
  # before_action :set_restaurant, except: %i[index new create]

  # def index
  #   @restaurants = Restaurant.all
  # end

  # def new
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @review = Review.new
  # end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render template: 'restaurants/show'
    end
  end



  # def edit; end

  # def show; end

  # def update
  #   @restaurant.update(restaurant_params)
  #   redirect_to restaurants_path(@restaurant)
  # end

  # def destroy
  #   @restaurant.destroy
  #   redirect_to restaurants_path
  # end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:id])
  # end
end
