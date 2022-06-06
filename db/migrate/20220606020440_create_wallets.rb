# frozen_string_literal: true

class CreateWallets < ActiveRecord::Migration[7.1]
  def up
    create_table :wallets do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }

      t.decimal :balance, precision: 10, scale: 2, default: 0.0
      t.decimal :incomes, precision: 10, scale: 2, default: 0.0
      t.decimal :expenses, precision: 10, scale: 2, default: 0.0
    end
  end

  def down
    drop_table :wallets
  end
end
