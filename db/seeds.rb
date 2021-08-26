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

      opening_hours = [8, 8.30, 9, 9.30, 10].sample
      closing_hours = [8, 8.30, 9, 9.30, 10, 10.30, 11, 11.30, 12].sample
      payment_method = ["cash", "credit", "paypal"].sample
      category = ["Japanese", "Chinese", "Greasy-spoon", "Thai", "Mexican", "Mongolian", "Semi-fast food", "Italian", "Cafe'"].sample
      michael_restaurant = Restaurant.create!(
      name: "Miguels",
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.cell_phone,
      category: "Mexican",
      opening_hours: opening_hours,
      closing_hours: closing_hours,
      payment_method: payment_method,
      address: "Yokosuka-shi, Kanagawa, Japan"
      )

  michael = User.create!(
    name:"Michael Carter",
    phone_number: "1234567",
    card_detail: "",
    email: "michael@nomo.com",
    password: "123456",
    restaurant: michael_restaurant,
    address: "Yokosuka-shi, Kanagawa, Japan"
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
    name: 'Tortillas',
    url: 'https://images.unsplash.com/photo-1599232288126-7dbd2127db14?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
  },
  {
    name: 'Garlic',
    url: 'https://images.unsplash.com/photo-1540148426945-6cf22a6b2383?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
  },
  {
    name: 'Ginger',
    url: 'https://images.unsplash.com/photo-1615484478243-c94e896edbae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80',
  },
  {
    name: 'Tomatoes',
    url: 'https://images.unsplash.com/photo-1597160308671-bb9ec5348ae3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
  },
  {
    name: 'Lettuce',
    url: 'https://images.unsplash.com/photo-1556801712-76c8eb07bbc9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=925&q=80',
  },
  {
    name: 'Clams',
    url: 'https://images.unsplash.com/photo-1545447890-4d8dc17c2a88?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2252&q=80',
  },
  {
    name: 'Fish',
    url: 'https://images.unsplash.com/photo-1499125562588-29fb8a56b5d5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80',
  },
  {
    name: 'Shrimp',
    url: 'https://images.unsplash.com/photo-1587045170851-8c8e5c08b6e2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
  },
  {
    name: 'Beef',
    url: 'https://images.unsplash.com/photo-1595356161904-6708c97be89c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
  },
  {
    name: 'Asparagus',
    url: 'https://images.unsplash.com/photo-1555704574-f9ecf4717298?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
  },
  {
    name: 'Carrots',
    url: 'https://images.unsplash.com/photo-1582515073490-39981397c445?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
  },
  {
    name: 'Cilantro',
    url: 'https://images.unsplash.com/photo-1535189487909-a262ad10c165?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2189&q=80',
  },
  {
    name: 'Beans',
    url: 'https://images.unsplash.com/photo-1599249478506-ae175f801b1e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
  },
  {
    name: 'Avocados',
    url: 'https://images.unsplash.com/photo-1543363136-7fbfcd3b240d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80',
  },
  {
    name: 'Radishes',
    url: 'https://images.unsplash.com/photo-1593026122758-19bebc625104?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
  },
  {
    name: 'Limes',
    url: 'https://images.unsplash.com/photo-1620101680155-b251043b700b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2426&q=80',
  },
  {
    name: 'Bell Peppers',
    url: 'https://images.unsplash.com/photo-1621953723422-6023013f659d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80',
  },
    {
    name: 'Corn',
    url: 'https://images.unsplash.com/photo-1551754655-cd27e38d2076?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80',
  },
    {
    name: 'Spinach',
    url: 'https://images.unsplash.com/photo-1583681781586-b980500f327a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80',
  },
    {
    name: 'Mushrooms',
    url: 'https://images.unsplash.com/photo-1552825897-bb5efa86eab1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80',
  },
    {
    name: 'Jalapenos',
    url: 'https://images.unsplash.com/photo-1597115580039-b849ed2d6398?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2767&q=80',
  },
    {
    name: 'Onions',
    url: 'https://images.unsplash.com/photo-1580201092675-a0a6a6cafbb1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80',
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
    discount_rate = [30, 40, 50, 60].sample
    veg = ingredient_data[veg_index]
    file = URI.open(veg[:url])
      ingredient = Ingredient.new(
      name: veg[:name],
      unit_price: Faker::Commerce.price(range: 1..10.0),
      # expiry_date: Faker::Date.between(from: '2021-08-23', to: '2021-08-30'),
      expiry_date: Faker::Date.between(from: 10.days.ago, to: Date.today),
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

  90.times do |time|
       description = ["Over stock that needs a home, and fast. Quality is good but it must be used quickly
      ", "Over ripening stock that is suitable for recipes and cooking, but not to be eaten out of hand
      ", "Must be consumed within 2 days. Only take it if you can use it today or tomorrow.
      ", "Nothing wrong with this product. We just have too much of it. Help us not waste it!
      "].sample
      veg = ingredient_data[veg_index]
      file = URI.open(veg[:url])
      ingredient = Ingredient.new(
      name: veg[:name],
      unit_price: Faker::Commerce.price(range: 1..10.0),
      # expiry_date: Date.today - 3.months - time.days,
      expiry_date: Faker::Date.between(from: 30.days.ago, to: Date.today),
      weight: Faker::Measurement.weight,
      stock_amount: Faker::Number.between(from: 1, to: 15),
      discount_rate: [30, 40, 50, 60].sample,
      public_status: 1,
      status: [0, 1].sample,
      description: description,
      seller: michael,
      unit: "Kg"
      )
      ingredient.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
      ingredient.save
      if veg_index >= 15
        veg_index = 0
      else
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



