require_relative 'frequent_renter_points'

class Movie
  class ChildrenPrice
    include FrequentRenterPoints

    def amount_due(days_rented)
      amount = 1.5
      amount += (days_rented - 3) * 1.5 if days_rented > 3

      amount
    end
  end
end


