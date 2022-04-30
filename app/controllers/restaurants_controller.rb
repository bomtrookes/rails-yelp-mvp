# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: %i[show edit]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show; end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit; end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
