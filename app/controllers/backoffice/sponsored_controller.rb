# This class is responsible for ...

class Backoffice::SponsoredController < ApplicationController
  before_action :authenticate_user!

  def index
    @filters = define_filters('sponsored')
    query = SponsoredQuery.call(relation: current_user, filters: @filters)
    @sponsored = query.page(params[:page])
      .per(params[:limit])
  end
end
