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

  # create_table "orders", force: :cascade do |t|
  #   t.integer "total_price"
  #   t.string "pay_method"
  #   t.string "status"
  #   t.bigint "buyer_id", null: false
  #   t.datetime "created_at", precision: 6, null: false
  #   t.datetime "updated_at", precision: 6, null: false
  #   t.index ["buyer_id_id"], name: "index_orders_on_buyer_id_id"
  puts "Destroying users, restaruants and ingredients..."
  Users.destroy_all
  Restaurant.destroy_all
  Ingredient.destroy_all
  Order.destroy_all
  puts "Generating new data"

  10.times do
    category = ["Japanese", "Chinese", "Greasy-spoon", "Thai", "Mexican", "Mongolian", "Semi-fast food", "Italian", "Cafe'"].sample
    user = Restaurant.new(
      name: Faker::Restaurant.name,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.cell_phone,
      category: category,
      )

    pay_method = ["cash", "credit", "paypal"].sample
    status = ["collected", "Not collected"].sample
    order = Order.new(
      total_price: Faker::Commerce.price,
      pay_method: pay_method,
      status: status,
      )





  end
