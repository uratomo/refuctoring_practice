class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_accessor :price_code

  def initialize(title,price_code)
    @title,self.price_code =title,price_code
  end

  def price_code=(value)
    @price_code =value
    @price = case price_code
      when REGULAR: RegularPrice.new
      when NEW_RELEASE: NewReleasePrice.new
      when CHILDRENS: ChildrensPrice.new
    end
  end

  def charge(charge_days)
      return @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    (movie.price_code == NEW_RELEASE && days_rented >1)? 2 : 1
  end
end
