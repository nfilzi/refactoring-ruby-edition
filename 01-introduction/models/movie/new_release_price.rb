require_relative 'frequent_renter_points'

class Movie
  class NewReleasePrice
    include FrequentRenterPoints

    def amount_due(days_rented)
      days_rented * 3
    end

    def bonus_frequent_renter_points(days_rented)
      1
    end
  end
end

