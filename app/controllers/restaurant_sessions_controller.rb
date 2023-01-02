class RestaurantSessionsController < ApplicationController
  def create
    restaurant = Restaurant.find_by(email: params[:email])
    if restaurant && restaurant.authenticate(params[:password])
      jwt = JWT.encode(
        {
          restaurant_id: restaurant.id, # the data to encode
          exp: 24.hours.from_now.to_i, # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      render json: { jwt: jwt, email: restaurant.email, restaurant_id: restaurant.id }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end
