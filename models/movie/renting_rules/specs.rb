class Movie
  class RentingRules
    SPECS = {
      new_release: {
        base_price:                   ->(days_rented) { days_rented * 3 },
        additional_billing:           ->(_) { 0 },
        base_frequent_renter_points:  ->(_) { 1 },
        bonus_frequent_renter_points: ->(days_rented) { days_rented > 1 ? 1 : 0 }
      },
      regular: {
        base_price:                   ->(_) { 2 },
        additional_billing:           ->(days_rented) { days_rented > 2 ? (days_rented - 2) * 1.5 : 0 },
        base_frequent_renter_points:  ->(_) { 1 },
        bonus_frequent_renter_points: ->(_) { 0 }
      },
      children: {
        base_price:                   ->(_) { 1.5 },
        additional_billing:           ->(days_rented) { days_rented > 3 ? (days_rented - 3) * 1.5 : 0 },
        base_frequent_renter_points:  ->(_) { 1 },
        bonus_frequent_renter_points: ->(_) { 0 }
      },
      exclusive: {
        base_price:                   ->(_) { 2 },
        additional_billing:           ->(days_rented) { days_rented > 2 ? (days_rented - 2) * 3 : 0 },
        base_frequent_renter_points:  ->(_) { 2 },
        bonus_frequent_renter_points: ->(_) { 0 }
      },
    }
  end
end
