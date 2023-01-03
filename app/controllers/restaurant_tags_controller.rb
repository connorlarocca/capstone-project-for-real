class RestaurantTagsController < ApplicationController
  before_action :authenticate_restaurant, except: [:index, :show]

  def index
    @tags = RestaurantTag.all
    render json: @tags.as_json
  end

  def show
    @tag = RestaurantTag.find_by(id: params[:id])
    render :show
  end

  def create
    tag = RestaurantTag.create(
      restaurant_id: current_restaurant.id,
      vegan: params[:vegan],
      vegetarian: params[:vegetarian],
      spicy: params[:spicy],
      gluten_free: params[:gluten_free],
    )
    if tag.save
      render json: tag.as_json
    else
      render json: { errors: tag.errors.full_messages }, status: 418
    end
  end

  def update
    tag = RestaurantTag.find_by(id: params[:id])
    tag.update(
      vegan: params[:vegan] || tag.vegan,
      vegetarian: params[:vegetarian] || tag.vegetarian,
      spicy: params[:spicy] || tag.spicy,
      gluten_free: params[:gluten_free] || tag.gluten_free,
    )
    if tag.save
      render json: tag.as_json
    else
      render json: { errors: tag.errors.full_messages }, status: 418
    end
  end

  def destroy
    tag = RestaurantTag.find_by(id: params[:id])
    tag.destroy
    render json: { message: "tag destroyed successfully" }
  end
end


