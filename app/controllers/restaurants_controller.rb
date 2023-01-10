class RestaurantsController < ApplicationController
  before_action :authenticate_restaurant, except: [:index, :create, :show, :random]

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
      phone_number: params[:phone_number],
      website: params[:website],
      image_url: params[:image_url],
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
    restaurant = Restaurant.find_by(id: params[:id])
    if restaurant.id == current_restaurant.id
      restaurant.name = params["name"] || restaurant.name
      restaurant.email = params["email"] || restaurant.email
      restaurant.phone_number = params["phone_number"] || restaurant.phone_number
      restaurant.website = params["website"] || restaurant.website
      restaurant.image_url = params["image_url"] || restaurant.image_url

      @restaurant = restaurant
      if restaurant.save
        render json: restaurant
      else
        render json: { errors: restaurant.errors.full_messages }, status: 418
      end
    else
      render json: { errors: restaurant.errors.full_messages }, status: 401
    end
  end

  def destroy
    restaurant = Restaurant.find_by(id: params[:id])
    if restaurant.id == current_restaurant.id
      if restaurant.delete
        render json: { message: "restaurant Succesfully Removed" }
      else
        render json: { errors: restaurant.errors.full_messages }, status: :bad_request
      end
    else
      render json: { errors: restaurant.errors.full_messages }, status: 401
    end
  end

  def random
    @restaurant = Restaurant.all.sample()
    render :show
  end
end
