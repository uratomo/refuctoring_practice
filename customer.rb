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

  def amount_for(rental)
    rental.charge
  end

 private
  def total_charge
    result = 0
    @rentals.each do |element|
      result += element.charge
    end
    return result
  end

  
end
