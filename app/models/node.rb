class Node < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :sponsor_node, class_name: 'Node', optional: true
  belongs_to :parent_node, class_name: 'Node', optional: true

  validates :lft, presence: true
  validates :rgt, presence: true
  validates :depth, presence: true
  validates :points, presence: true

  scope :order_by_right_desc, -> { order(rgt: :desc) }
  scope :right_latest, -> { order_by_right_desc.first }
  scope :nodes_from_target, ->(target) { where("rgt >= :target", target: target) }
end
