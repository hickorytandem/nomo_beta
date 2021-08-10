# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # create_table "ingredients", force: :cascade do |t|
  #   t.string "name"
  #   t.integer "unit_price"
  #   t.date "expiry_date"
  #   t.integer "weight"
  #   t.integer "stock_amount"
  #   t.integer "unit"
  #   t.integer "discount_rate"
  #   t.integer "public_status"
  #   t.text "description"
  #   t.integer "status"

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
    public_status = ["availalble", "not available"]
    description = ["Over stock that needs a home, and fast. Quality is good but it must be used quickly
", "Over ripening stock that is suitable for recipes and cooking, but not to be eaten out of hand
", "Must be consumed within 2 days. Only take it if you can use it today or tomorrow.
", "Nothing wrong with this product. We just have too much of it. Help us not waste it!
"].sample
    ingredient = Ingredient.new(
      name: Faker::Food.ingredient,
      unit_price: Faker::Commerce.price(range: 0..10.0),
      expiry_date: Faker::Date.between(from: 4.days.ago, to: Date.today),
      weight: Faker::Measurement.weight,
      stock_amount: Faker::Number.between(from: 1, to: 15),
      public_status: public_status,
      description: description


      )





  end
