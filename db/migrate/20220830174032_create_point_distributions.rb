class CreatePointDistributions < ActiveRecord::Migration[6.1]
  def up
    create_table :point_distributions do |t|
      # Timestamps
      t.timestamps null: false

      # Custom fields
      t.boolean :done, default: false, null: false
      t.date :done_at
      t.decimal :base_value, precision: 10, scale: 2
      t.string :params

      # References
      t.references :user, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
      t.references :reference, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
      t.references :purchase, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
      t.references :user_point_record, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
    end
  end

  def down
    drop_table :point_distributions
  end
end
