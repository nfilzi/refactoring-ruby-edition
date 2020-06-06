class Rental
  attr_reader :movie, :days_rented

  BASE_FREQUENT_RENTER_POINTS       = 1
  BASE_BONUS_FREQUENT_RENTER_POINTS = 1

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def amount_due
    movie.renting_rules.amount_due_for_rental(self)
  end

  def total_frequent_renter_points
    movie.renting_rules.frequent_renter_points_for_rental(self)
  end
end
