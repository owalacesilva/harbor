# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: true, foreign_key: { on_delete: :cascade, on_update: :cascade }

      # Fields
      t.boolean :broadcast, default: false, null: false
      t.boolean :published, default: false, null: false
      t.boolean :opened, default: false, null: false
      t.string :title, null: false
      t.text :message, null: false
      t.string :url, null: true
    end
  end
end
