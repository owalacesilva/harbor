class IndexController < ApplicationController
  layout 'institutional'

  def index
    render :index, status: :ok
  end
end
