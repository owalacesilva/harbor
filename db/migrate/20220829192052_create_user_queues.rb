class CreateUserQueues < ActiveRecord::Migration[6.1]
  def up
    create_table :user_queues do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
      t.references :user_sponsor, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }

      # User Queue's status
      t.boolean :done, default: false, null: false
      t.date :done_at

      # User Queue's details
      t.string :side, null: false
    end
  end

  def down
    drop_table :user_queues, if_exists: true
  end
end
