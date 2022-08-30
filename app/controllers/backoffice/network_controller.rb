# This class is responsible for ...

class Backoffice::NetworkController < ApplicationController
  before_action :authenticate_user!

  def index
    @filters = define_filters('network')
    query = NetworkQuery.call(relation: current_user, filters: @filters)
    @users = query.order(created_at: :desc)
      .page(params[:page])
      .per(params[:limit])
      .decorate
  end
end
