class RestaurantsController < ApplicationController
  require 'pry'
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @category = Category.all.includes(:restaurants)
    @restaurant = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      flash[:danger] = @restaurant.errors.full_messages.to_sentence
      render 'new'
    end
    # redirect_to :action => 'show', :id => @restaurant
    
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: @restaurant)
    if @reviews.blank?
      @avg_rating= 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def search
    if params[:category].blank?
      @restaurant = Restaurant.all
    else
      @restaurant = Restaurant.search(params)
    end
  end

  def continue
    @restaurant = Restaurant.where(category_id: params[:category_id])
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :address1, 
                                  :address2, :category_id, :city, :state, :zipcode, :phone, :email, :image)
    end
end

