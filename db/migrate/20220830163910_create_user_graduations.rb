class CreateUserGraduations < ActiveRecord::Migration[6.1]
  def up
    create_table :user_graduations do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
      t.references :graduation, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
    end
  end

  def down
    drop_table :user_graduations
  end
end
