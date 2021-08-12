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
  User.destroy_all
  Restaurant.destroy_all
  Ingredient.destroy_all
  Order.destroy_all
  puts "Generating new data"

  10.times do
    opening_hours = [8, 8.30, 9, 9.30, 10].sample
    closing_hours = [8, 8.30, 9, 9.30, 10, 10.30, 11, 11.30, 12].sample
    payment_method = ["cash", "credit", "paypal"].sample
    # category = ["Japanese", "Chinese", "Greasy-spoon", "Thai", "Mexican", "Mongolian", "Semi-fast food", "Italian", "Cafe'"].sample
    user = Restaurant.new(
      name: Faker::Restaurant.name,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.cell_phone,
      # category: category,
      opening_hours: opening_hours,
      closing_hours: closing_hours,
      payment_method: payment_method
      )

    pay_method = ["cash", "credit", "paypal"].sample
    status = ["collected", "Not collected"].sample
    order = Order.new(
      total_price: Faker::Commerce.price,
      pay_method: pay_method,
      status: status,
      )
    # public_status = ["availalble", "not available"]
    description = ["Over stock that needs a home, and fast. Quality is good but it must be used quickly
      ", "Over ripening stock that is suitable for recipes and cooking, but not to be eaten out of hand
      ", "Must be consumed within 2 days. Only take it if you can use it today or tomorrow.
      ", "Nothing wrong with this product. We just have too much of it. Help us not waste it!
      "].sample
      discount_rate = [10, 20, 30, 40, 50, 60, 70, 80, 90].sample
      ingredient = Ingredient.new(
      name: Faker::Food.ingredient,
      unit_price: Faker::Commerce.price(range: 0..10.0),
      expiry_date: Faker::Date.between(from: 4.days.ago, to: Date.today),
      weight: Faker::Measurement.weight,
      stock_amount: Faker::Number.between(from: 1, to: 15),
      discount_rate: discount_rate,
      # public_status: public_status,
      description: description
      )

 total_price = [35.50, 52.50, 23, 45, 87, 92.50, 67.60, 55.50, 89, 15, 105, 16.50, 62, 78, 35, 25, 88, 125.50, 29, 40, 9.50].sample
 order = Order.new(
    total_price: total_price,
    pay_method: pay_method,
  )








  end
