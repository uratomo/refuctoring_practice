class Customer
  attr_reader :name

  def initialize(name)
    @name =name
    @rentals =[]
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    frequent_renter_points = 0
    result = "Rental Record for #{@name}\n"
    @rentals.each do |element|
      frequent_renter_points += element.frequent_renter_points
      
      result += "\t#{element.movie.title}\t#{element.charge.to_s}\n"
      total_amount += element.charge
    end
    # フッター行の追加
    result += "Amount owed is #{total_charge}\n"
    result += "You  earned #{frequent_renter_points} frequent renter points"
    return result
  end

  def html_statement
    result = "<h1>Rental Record for <em>#{@name}</em></h1><<p>\n"
    @rentals.each do |element|
      frequent_renter_points += element.frequent_renter_points
      
      result += "\t#{element.movie.title}\t#{element.charge.to_s}<br>\n"
      total_amount += element.charge
    end
    # フッター行の追加
    result += "<p>Amount owed is <em>#{total_charge}</em></p>\n"
    result += "You  earned <em>#{frequent_renter_points}</em> frequent renter points<p>"
    return result
  end

  def amount_for(rental)
    rental.charge
  end

 private
  def total_charge
    @rentals.inject(0){|sum,rental| sum + rental.charge}
  end

  
end
