module ApplicationHelper
  def change_date_format(date)
    new_date = date.to_s.split(' ').first
    Date.parse(new_date).strftime("%b %d")
  end

end
