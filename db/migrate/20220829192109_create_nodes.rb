class CreateNodes < ActiveRecord::Migration[6.1]
  def up
    create_table :nodes do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
      t.references :sponsor_node, null: true, foreign_key: { to_table: :nodes, on_delete: :nullify, on_update: :cascade }
      t.references :parent_node, null: true, foreign_key: { to_table: :nodes, on_delete: :nullify, on_update: :cascade }

      # User Node's details
      t.integer :lft, null: false
      t.integer :rgt, null: false
      t.integer :depth, null: false
      t.decimal :points, :precision => 10, :scale => 2, default: "0.0", null: false
    end
  end

  def down
    drop_table :nodes, if_exists: true
  end
end
