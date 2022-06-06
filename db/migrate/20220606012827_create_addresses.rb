# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.1]
  def up
    create_table :addresses do |t|
      # Timestamps
      t.timestamps null: false, precision: 6

      # References
      t.references :user, foreign_key: { on_delete: :cascade, on_update: :cascade }

      # Address' details
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :alternative_phone_number
      t.string :company_name
      t.string :postal_code
      t.string :street_address
      t.string :building_number
      t.string :recipient
      t.string :apartament
      t.string :door_code
      t.string :floor
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :state_abbr
      t.string :country
      t.string :country_code
      t.string :latitude
      t.string :longitude
    end
  end

  def down
    drop_table :addresses
  end
end
