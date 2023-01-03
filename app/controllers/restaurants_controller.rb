class RestaurantsController < ApplicationController
  before_action :authenticate_restaurant, except: [:index, :create, :show]

  def index
    @restaurants = Restaurant.all
    render :index
  end

  def create
    @restaurant_signup = Restaurant.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if @restaurant_signup.save
      render json: @restaurant_signup.as_json
    else
      render json: { errors: @restaurant_signup.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    render :show
  end

  def update
    restaurant = Restaurant.find_by(id: params["id"])
    restaurant.name = params["name"] || restaurant.name
    restaurant.email = params["email"] || restaurant.email
    @restaurant = restaurant
    if restaurant.save
      render json: restaurant
    else
      render json: { errors: restaurant.errors.full_messages }, status: 418
    end
  end

  def destroy
    restaurant = Restaurant.find_by(id: params[:id])
    if restaurant.delete
      render json: { message: "restaurant Succesfully Removed" }
    else
      render json: { errors: restaurant.errors.full_messages }, status: :bad_request
    end
  end
end
