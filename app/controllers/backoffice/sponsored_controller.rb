# This class is responsible for ...

class Backoffice::SponsoredController < ApplicationController
  before_action :authenticate_user!

  def index
    @sponsored = User.order(id: :desc)
  end
end
