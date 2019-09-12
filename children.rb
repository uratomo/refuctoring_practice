class ChildrensPrice
  def charge(day_rented)
    result =1.5
    result += (day_rented - 3) * 1.5 if day_rented >3
    result
  end
end
