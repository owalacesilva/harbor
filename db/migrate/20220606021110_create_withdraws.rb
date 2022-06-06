# frozen_string_literal: true

class CreateWithdraws < ActiveRecord::Migration[7.1]
  def up
    create_table :withdraws do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { on_delete: :cascade, on_update: :cascade }
      t.references :wallet, null: false, foreign_key: { on_delete: :cascade, on_update: :cascade }

      t.boolean :blocked, default: false, null: false
      t.date :blocked_at

      t.boolean :approved, default: false, null: false
      t.date :approved_at

      t.decimal :balance, precision: 10, scale: 2, default: 0.0
    end
  end

  def down
    drop_table :withdraws
  end
end
