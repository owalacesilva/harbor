class CreateUserQualifications < ActiveRecord::Migration[6.1]
  def up
    create_table :user_qualifications do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
      t.references :qualification, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
    end
  end

  def down
    drop_table :user_qualifications
  end
end
