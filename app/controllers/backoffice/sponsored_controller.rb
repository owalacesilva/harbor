# This class is responsible for ...

class Backoffice::SponsoredController < ApplicationController
  before_action :authenticate_user!

  def index
    @filters = define_filters('sponsored')
    query = SponsoredQuery.call(relation: current_user, filters: @filters)
    @sponsored = query.order(created_at: :desc).page(params[:page])
      .per(params[:limit])
      .decorate
  end

  def new
    @user = User.new
  end

  def create
    password_length = 6
    password = Devise.friendly_token.first(password_length)
    @user = User.new(user_params.merge(sponsor: current_user, 
      :password => password, :password_confirmation => password))

    return render :create if @user.save

    flash.now[:alert] = @user.errors.full_messages
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:email, :email_confirmation,
        :profile_attributes => [:first_name, :last_name, :gender, :phone_number])
  end
end
