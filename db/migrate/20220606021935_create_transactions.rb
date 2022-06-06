# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.1]
  def up
    create_table :transactions do |t|
      # Timestamps
      t.timestamps null: false

      t.string :code, null: false, limit: 45, unique: true

      t.references :user, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
      t.references :origin_wallet, null: false, foreign_key: { to_table: :wallets, on_delete: :restrict, on_update: :cascade }
      t.references :target_wallet, null: false, foreign_key: { to_table: :wallets, on_delete: :restrict, on_update: :cascade }
      t.references :reference, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
      t.references :withdraw, foreign_key: { on_delete: :cascade, on_update: :cascade }

      t.string :operation, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.decimal :point_amount, precision: 10, scale: 2, null: false
      t.string :description
    end
  end

  def down
    drop_table :transactions
  end
end
