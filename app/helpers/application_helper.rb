module ApplicationHelper
  def change_date_format(date)
    new_date = date.to_s.split(' ').first
    Date.parse(new_date).strftime("%b %d, %Y")
  end

  def sum_ingredient_price(stock_amount, unit_price)
    @sum = stock_amount * unit_price
  end

end
