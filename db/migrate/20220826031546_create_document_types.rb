# frozen_string_literal: true

class CreateDocumentTypes < ActiveRecord::Migration[7.1]
  def up
    create_table :document_types do |t|
      t.timestamps null: false

      t.string :unique_name, null: false, limit: 45, unique: true
      t.string :display_name, null: false, limit: 45
      t.string :description, limit: 255
    end
  end

  def down
    drop_table :document_types
  end
end
