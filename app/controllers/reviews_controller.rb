# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [:new]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
