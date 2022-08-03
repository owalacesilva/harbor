class Admin::UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]
  before_action :populate_user, only: %i[create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if @user.save
      redirect_to admin_user_path(@user)
    else
      render :new
    end
  end

  def show
    render :show
  end

  def edit
    render :edit
  end

  def update
    if @user.update
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path
    else
      render :index
    end
  end

  private

  def user_params
    params.required(:user).permit(:email, :password, profile_attributes:
                                 [:first_name, :last_name, :gender, :birth_date, :phone_number])
  end

  def find_user
    @user = User.find(params[:id])
  end

  def populate_user
    @user = User.new(user_params)
  end
end
