module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
    helper_method :user_signed_in?
    before_action :current_restaurant
    helper_method :current_restaurant
    helper_method :restaurant_signed_in?
  end

  def login(user)
    reset_session
    session[:current_user_id] = user.id
  end

  def login(restaurant)
    reset_session
    session[:current_restaurant_id] = restaurant.id
  end

  def logout
    reset_session
  end

  def redirect_if_authenticated
    redirect_to root_path, alert: "You are already logged in." if user_signed_in? || restaurant_signed_in?
  end

  private

  def current_user
    Current.user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  def user_signed_in?
    Current.user.present?
  end

  def current_restaurant
    Current.restaurant ||= session[:current_restaurant_id] && restaurant.find_by(id: session[:current_restaurant_id])
  end

  def restaurant_signed_in?
    Current.restaurant.present?
  end
end
