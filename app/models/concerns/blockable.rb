# This class is responsible for ...

module Blockable
  extend ActiveSupport::Concern

  def block
    update(blocked: true, blocked_at: Date.current)
  end

  def unblock
    update(blocked: false)
  end

  def blocked?
    blocked
  end
end
