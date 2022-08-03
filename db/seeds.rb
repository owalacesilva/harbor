# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Role.create!(unique_name: :employee, display_name: "Funcionário")
Reference.create!(unique_name: :token, display_name: "TOKEN")

unless Rails.env.production? || Rails.env.test?
  user_attrs = FactoryBot.attributes_for(:user, email: 'user@email.com', password: '123456')
  user = User.new(user_attrs)
  user.save!

  profile_attrs = FactoryBot.attributes_for(:profile)
  profile = user.build_profile(profile_attrs)
  profile.save!
end
