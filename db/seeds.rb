# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  # create_table "restaurants", force: :cascade do |t|
  #   t.string "name"
  #   t.string "email"
  #   t.string "phone_number"
  #   t.string "catogory"
  #   t.integer "opening_hours"
  #   t.integer "closing_hours"
  #   t.string "payment_method"

  10.times do
    category = ["Japanese", "Chinese", "Greasy-spoon", "Thai", "Mexican", "Mongolian", "Semi-fast food", "Italian", "Cafe'"].sample
    user = Restaurant.new(
      name: Faker::Restaurant.name,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.cell_phone,
      category: category,
      )

  end
