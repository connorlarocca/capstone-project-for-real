class UsersController < ApplicationController
  before_action :authenticate_user, except: [:index, :create, :show]

  def index
    @users = User.all
    render :index
  end

  def create
    @user_signup = User.new(
      name: params[:name],
      email: params[:email],
      image_url: params[:image_url],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if @user_signup.save
      render json: @user_signup.as_json
    else
      render json: { errors: @user_signup.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def update
    user = User.find_by(id: params["id"])
    user.name = params["name"] || user.name
    user.email = params["email"] || user.email
    @user = user
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: 418
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user.delete
      render json: { message: "user Succesfully Removed" }
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
