class CreateUserPointRecords < ActiveRecord::Migration[6.1]
  def up
    create_table :user_point_records do |t|
      # Timestamps
      t.timestamps null: false

      # References
      t.references :user, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }
      t.references :origin_user, null: false, foreign_key: { to_table: :users, on_delete: :restrict, on_update: :cascade }
      t.references :reference, null: false, foreign_key: { on_delete: :restrict, on_update: :cascade }

      # Custom fields
      t.date :record_date
      t.decimal :base_value, precision: 10, scale: 2
      t.decimal :amount, precision: 10, scale: 2
    end
  end


  def down
    drop_table :user_point_records
  end
end
