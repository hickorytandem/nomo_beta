 require "open-uri"

  puts "Destroying users, restaruants and ingredients..."
  Restaurant.destroy_all
  Ingredient.destroy_all
  Order.destroy_all
  User.destroy_all
  puts "Generating new data"

    #   t.string "address"
    # t.string "name"
    # t.string "phone_number"
    # t.string "card_detail"
    opening_hours = [8, 8.30, 9, 9.30, 10].sample
    closing_hours = [8, 8.30, 9, 9.30, 10, 10.30, 11, 11.30, 12].sample
    payment_method = ["cash", "credit", "paypal"].sample
    category = ["Japanese", "Chinese", "Greasy-spoon", "Thai", "Mexican", "Mongolian", "Semi-fast food", "Italian", "Cafe'"].sample
    anna_restaurant = Restaurant.create!(
      name: Faker::Restaurant.name,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.cell_phone,
      category: category,
      opening_hours: opening_hours,
      closing_hours: closing_hours,
      payment_method: payment_method,
      address: "Kabuto-cho, Nihonbashi, Tokyo, Japan"
      )

    opening_hours = [8, 8.30, 9, 9.30, 10].sample
    closing_hours = [8, 8.30, 9, 9.30, 10, 10.30, 11, 11.30, 12].sample
    payment_method = ["cash", "credit", "paypal"].sample
    category = ["Japanese", "Chinese", "Greasy-spoon", "Thai", "Mexican", "Mongolian", "Semi-fast food", "Italian", "Cafe'"].sample
    yui_restaurant = Restaurant.create!(
      name: Faker::Restaurant.name,
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.cell_phone,
      category: category,
      opening_hours: opening_hours,
      closing_hours: closing_hours,
      payment_method: payment_method,
      address: "Musashikosugi, Kanagawa, Japan"
      )

  michael = User.create!(
    name:"Michael Carter",
    phone_number: "1234567",
    card_detail: "",
    email: "michael@nomo.com",
    password: "123456",
    address: "Kawasaki-shi, Kanagawa, Japan"
    )
   yui = User.create!(
    name:"Yui Kondo",
    phone_number: "1234567",
    card_detail: "",
    email: "yui@nomo.com",
    password: "123456",
    restaurant: yui_restaurant,
    address: "Meguro-ku, Tokyo, Japan"
    )
    anna = User.create!(
    name:"Anna Nonaka",
    phone_number: "1234567",
    card_detail: "",
    email: "anna@nomo.com",
    password: "123456",
    restaurant: anna_restaurant,
    address: "Shinagawa-ku, Tokyo, Japan"
    )
    namkhing = User.create!(
    name:"Nonlapat Leesomprasong",
    phone_number: "1234567",
    card_detail: "",
    email: "namkhing@nomo.com",
    password: "123456",
    address: "Minato-ku, Tokyo, Japan"
    )

    pay_method = ["cash", "credit", "paypal"].sample
    status = [:pending, :collected, :purchased, :cancelled].sample
    order = Order.create!(
      total_price: Faker::Commerce.price,
      pay_method: pay_method,
      status: status,
      buyer: namkhing
      )

  15.times do

    # public_status = ["availalble", "not available"]
    description = ["Over stock that needs a home, and fast. Quality is good but it must be used quickly
      ", "Over ripening stock that is suitable for recipes and cooking, but not to be eaten out of hand
      ", "Must be consumed within 2 days. Only take it if you can use it today or tomorrow.
      ", "Nothing wrong with this product. We just have too much of it. Help us not waste it!
      "].sample
      discount_rate = [10, 20, 30, 40, 50, 60, 70, 80, 90].sample


file = URI.open('https://source.unsplash.com/1600x900/?vegetable')
      ingredient = Ingredient.new(
      name: Faker::Food.ingredient,
      unit_price: Faker::Commerce.price(range: 0..10.0),
      expiry_date: Faker::Date.between(from: 4.days.ago, to: Date.today),
      weight: Faker::Measurement.weight,
      stock_amount: Faker::Number.between(from: 1, to: 15),
      discount_rate: discount_rate,
      # public_status: public_status,
      description: description,
      seller: [yui, anna].sample,
      order: order,
      unit: "Kg"
      )
      ingredient.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
      ingredient.save
    end

 # total_price = [35.50, 52.50, 23, 45, 87, 92.50, 67.60, 55.50, 89, 15, 105, 16.50, 62, 78, 35, 25, 88, 125.50, 29, 40, 9.50].sample
 # order = Order.create(
 #    total_price: total_price,
 #    pay_method: pay_method,
 #    user:
 #  )

