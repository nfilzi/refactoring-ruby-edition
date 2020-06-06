module FrequentRenterPoints
  def total_frequent_renter_points(days_rented)
    base_frequent_renter_points(days_rented) + bonus_frequent_renter_points(days_rented)
  end

  def base_frequent_renter_points(days_rented)
    1
  end

  def bonus_frequent_renter_points(days_rented)
    0
  end
end
