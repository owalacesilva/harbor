# frozen_string_literal: true

class CreateBankingAccounts < ActiveRecord::Migration[7.1]
  def up
    create_table :banking_accounts do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }

      # Custom fields
      t.string :bank_code
      t.string :bank_name
      t.string :account_type
      t.string :branch_number
      t.string :branch_code
      t.string :account_number
      t.string :account_code
      t.string :holder_name
      t.string :document_number
      t.string :operation
    end
  end

  def down
    drop_table :banking_accounts
  end
end
