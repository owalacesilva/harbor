class CreateUserPoints < ActiveRecord::Migration[6.1]
  def up
    create_table :user_points do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
      t.references :reference, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }

      # Custom fields
      t.decimal :amount, precision: 10, scale: 2
    end

    # CREATE UNIQUE INDEX index_user_points_on_user_id_and_reference_id ON accounts(user_id, reference_id)
    add_index :user_points, [:user_id, :reference_id], unique: true, if_not_exists: true
  end

  def down
    remove_index :user_points, [:user_id, :reference_id], unique: true, if_not_exists: true
    drop_table :user_points
  end
end
