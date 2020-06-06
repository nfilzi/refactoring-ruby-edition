require_relative 'frequent_renter_points'

class Movie
  class RegularPrice
    include FrequentRenterPoints

    def amount_due(days_rented)
      amount = 2
      amount += (days_rented - 2) * 1.5 if days_rented > 2

      amount
    end
  end
end
