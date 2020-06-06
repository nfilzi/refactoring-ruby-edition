class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  BASE_FREQUENT_RENTER_POINTS       = 1
  BASE_BONUS_FREQUENT_RENTER_POINTS = 1

  attr_reader   :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end

  def amount_due_for(days_rented)
    amount = 0
    case price_code
    when Movie::REGULAR
      amount += 2
      amount += (days_rented - 2) * 1.5 if days_rented > 2

    when Movie::NEW_RELEASE
      amount += days_rented * 3

    when Movie::CHILDRENS
      amount += 1.5
      amount += (days_rented - 3) * 1.5 if days_rented > 3
    end

    amount
  end

  def total_frequent_renter_points(days_rented)
    BASE_FREQUENT_RENTER_POINTS + bonus_frequent_renter_points(days_rented)
  end

  def bonus_frequent_renter_points(days_rented)
    if price_code == Movie::NEW_RELEASE && days_rented > 1
      BASE_BONUS_FREQUENT_RENTER_POINTS
    else
      0
    end
  end
end
