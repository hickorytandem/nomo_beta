module ApplicationHelper
  def change_date_format(date)
    new_date = date.to_s.split(' ').first
    Date.parse(new_date).strftime("%b %d, %Y")
  end

  def sum_ingredient_price(stock_amount, unit_price)
    @sum = stock_amount * unit_price
  end

  def total_price(order)
    @total_price = 0
    # All sum ingredients
    order.ingredients.each do |ingredient|
      ingredient_price = sum_ingredient_price(ingredient.stock_amount, ingredient.price)
      @total_price += ingredient_price
    end
    @total_price
  end

end
