class CreateProfiles < ActiveRecord::Migration[7.1]
  def up
    create_table :profiles do |t|
      t.timestamps null: false

      t.string :first_name, null: false, limit: 45
      t.string :last_name, limit: 45
      t.string :gender, null: false, limit: 9, default: "undefined"
      t.date :birth_date
      t.string :phone_number, limit: 45
    end
  end

  def down
    drop_table :profiles
  end
end
