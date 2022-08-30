# This class is responsible for ...

class Backoffice::NetworkController < ApplicationController
  before_action :authenticate_user!

  def index
    @node = current_user.node
    @users = User.joins(:node)
      .where(node: { lft: @node.lft..@node.rgt })
      .where('node.lft = (node.rgt - 1)')
      .order(created_at: :desc)
  end
end
