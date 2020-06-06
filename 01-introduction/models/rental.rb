class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def amount_due
    @amount_due ||= movie.amount_due_for(days_rented)
  end

  def total_frequent_renter_points
    @total_frequent_renter_points ||= movie.total_frequent_renter_points(days_rented)
  end
end
