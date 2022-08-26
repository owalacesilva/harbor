# frozen_string_literal: true

class CreateDocuments < ActiveRecord::Migration[7.1]
  def up
    create_table :documents do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
      t.references :document_type, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }

      t.boolean :blocked, default: false, null: false
      t.date :blocked_at

      t.boolean :approved, default: false, null: false
      t.date :approved_at

      t.jsonb :image_data
    end
  end

  def down
    drop_table :documents
  end
end
