class FavoritesController < ApplicationController
  # before_action :authenticate_user

  def index
    @favorites = Favorite.all
    render json: @favorites.as_json
  end

  def show
    @favorite = Favorite.find_by(id: params[:id])
    render json: @favorite.as_json
  end

  def create
    favorite = Favorite.create(
      user_id: current_user.id,
      restaurant_id: params[:restaurant_id],
    )
    if favorite.save
      render json: favorite.as_json
    else
      render json: { errors: @favorite.errors.full_messages }, status: 418
    end
  end

  def destroy
    if user.id == current_user.id
      if user.delete
        render json: { message: "user Succesfully Removed" }
      else
        render json: { errors: user.errors.full_messages }, status: :bad_request
      end
    else
      render json: { errors: user.errors.full_messages }, status: 401
    end
  end
end
