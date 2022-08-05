# frozen_string_literal: true

class CreateReferences < ActiveRecord::Migration[7.1]
  def up
    create_table :references do |t|
      # Timestamps
      t.timestamps null: false

      t.string :unique_name, null: false, limit: 45, unique: true
      t.string :display_name, limit: 45
      t.string :description, limit: 255
      t.decimal :unit_price, precision: 10, scale: 2, null: false, default: "0.0"
    end
  end

  def down
    drop_table :references
  end
end
