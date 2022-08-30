class UserQueueService
  prepend SimpleCommand

  attr_reader :user_data, :user, :user_sponsor

  def initialize(user_data)
    @user_data = user_data
    @user = user_data.user
    @user_sponsor = user_data.user_sponsor
  end

  def call
    ActiveRecord::Base.transaction { run_actions }
  end

  private

  def run_actions
    user_node_spilled?
    user_sponsor_node = user_sponsor_spilled
    insert_user_network_node(user_sponsor_node, @user)
  rescue StandardError => e
    errors.add(:errors, e
    .message)
  end

  def user_node_spilled?
    raise ArgumentError.new("Usuário já alocado na rede") if @user.node.present?
  end

  def user_sponsor_spilled
    user_sponsor_node = @user_sponsor.node
    raise ArgumentError.new("Usuário patrocinador não alocado na rede") if user_sponsor_node.nil?

    user_sponsor_node
  end

  def insert_user_network_node(parent_node, user)
    update_service
    target = parent_target_node(parent_node)
    create_user_network_node(parent_node, user, target)
  end

  def parent_target_node(parent_node)
    if parent_node.nil?
      parent_node_right_latest
    else
      parent_node.rgt
    end
  end

  def parent_node_right_latest
    parent_node_latest = Node.right_latest
    parent_node_latest.rgt + 1
  end

  def update_all_nodes_before_insert(target)
    Node.nodes_from_target(target).each do |node|
      node.lft += 2 if node.lft >= target
      node.rgt += 2
      node.save!
    end
  end

  def create_user_network_node(user_parent_node, user, target)
    update_all_nodes_before_insert(target)
    user_node = Node.new(user: user, sponsor_node: user_parent_node, parent_node: user_parent_node,
                                depth: (user_parent_node.depth + 1), lft: target, rgt: (target + 1))
    user_node.save!
    user_node
  end

  def update_service
    @user_data.done = true
    @user_data.save!
  end
end
