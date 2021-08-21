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
      address: "Nihonbashi, Tokyo, Japan"
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
ingredient_data = [
  {
    name: 'mango',
    url: 'https://images.unsplash.com/photo-1587131808575-655697d61a4e?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8aW5ncmVkaWVudHMsbWFuZ298fHx8fHwxNjI5NTE2MjA0&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600',
  },
  {
    name: 'banana',
    url: 'https://images.unsplash.com/photo-1587334206596-c0f9f7dccbe6?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8YmFuYW5hfHx8fHx8MTYyOTUxNjM1Ng&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600',
  },
  {
    name: 'ginger',
    url: 'https://images.unsplash.com/photo-1615484478243-c94e896edbae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80',
  },
  {
    name: 'tomato',
    url: 'https://images.unsplash.com/photo-1597160308671-bb9ec5348ae3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
  },
  {
    name: 'lettuce',
    url: 'https://images.unsplash.com/photo-1556801712-76c8eb07bbc9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=925&q=80',
  },
  {
    name: 'clams',
    url: 'https://images.unsplash.com/photo-1545447890-4d8dc17c2a88?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2252&q=80',
  },
  {
    name: 'fish',
    url: 'https://images.unsplash.com/photo-1499125562588-29fb8a56b5d5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80',
  },
  {
    name: 'strawberry',
    url: 'https://images.unsplash.com/photo-1518635017498-87f514b751ba?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80',
  },
  {
    name: 'beef',
    url: 'https://images.unsplash.com/photo-1595356161904-6708c97be89c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
  },
  {
    name: 'asparagus',
    url: 'https://images.unsplash.com/photo-1555704574-f9ecf4717298?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
  },
  {
    name: 'carrot',
    url: 'https://images.unsplash.com/photo-1582515073490-39981397c445?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
  },
  {
    name: 'grapefruit',
    url: 'https://images.unsplash.com/photo-1533252720003-9be5ea45fffc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1104&q=80',
  },
  {
    name: 'beans',
    url: 'https://images.unsplash.com/photo-1599249478506-ae175f801b1e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
  },
  {
    name: 'avocado',
    url: 'https://images.unsplash.com/photo-1543363136-7fbfcd3b240d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80',
  },
  {
    name: 'radish',
    url: 'https://images.unsplash.com/photo-1593026122758-19bebc625104?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
  },
  {
    name: 'brussel sprout',
    url: 'https://images.unsplash.com/photo-1438118907704-7718ee9a191a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
  }
]
veg_index = 0
User.all.each do |user|
  next unless user.restaurant
  3.times do |times|
    # public_status = ["availalble", "not available"]
    description = ["Over stock that needs a home, and fast. Quality is good but it must be used quickly
      ", "Over ripening stock that is suitable for recipes and cooking, but not to be eaten out of hand
      ", "Must be consumed within 2 days. Only take it if you can use it today or tomorrow.
      ", "Nothing wrong with this product. We just have too much of it. Help us not waste it!
      "].sample
    discount_rate = [10, 20, 30, 40, 50, 60, 70, 80, 90].sample
    veg = ingredient_data[veg_index]
    file = URI.open(veg[:url])
      ingredient = Ingredient.new(
      name: veg[:name],
      unit_price: Faker::Commerce.price(range: 0..10.0),
      expiry_date: Faker::Date.between(from: 4.days.ago, to: Date.today),
      weight: Faker::Measurement.weight,
      stock_amount: Faker::Number.between(from: 1, to: 15),
      discount_rate: discount_rate,
      public_status: 1,
      status: 1,
      description: description,
      seller: user,
      order: order,
      unit: "Kg"
      )
    ingredient.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
    ingredient.save
    veg_index += 1
  end
end

    puts "Done!"
 # total_price = [35.50, 52.50, 23, 45, 87, 92.50, 67.60, 55.50, 89, 15, 105, 16.50, 62, 78, 35, 25, 88, 125.50, 29, 40, 9.50].sample
 # order = Order.create(
 #    total_price: total_price,
 #    pay_method: pay_method,
 #    user:
 #  )



