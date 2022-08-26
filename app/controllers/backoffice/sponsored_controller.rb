# This class is responsible for ...

class Backoffice::SponsoredController < ApplicationController
  before_action :authenticate_user!

  def index
    @filters = define_filters('sponsored')
    @sponsored = User.order(id: :desc).page(params[:page])
      .per(params[:limit])
  end
end
