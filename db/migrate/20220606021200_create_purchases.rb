# frozen_string_literal: true

class CreatePurchases < ActiveRecord::Migration[7.1]
  def up
    create_table :purchases do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
      t.references :reference, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }

      t.string :code, null: false, limit: 45, unique: true
      t.string :status, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false, default: "0.0"
      t.decimal :total, precision: 10, scale: 2, null: false, default: "0.0"
      t.string :description
    end
  end

  def down
    drop_table :purchases
  end
end
