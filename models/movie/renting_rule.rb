class Movie
  class RentingRule
    attr_reader :base_price_computation, :additional_billing_computation,
                :base_frequent_renter_points_computation, :bonus_frequent_renter_points_computation

    def initialize(specs = {})
      @reference                                = specs[:reference]
      @base_price_computation                   = specs[:base_price]
      @additional_billing_computation           = specs[:additional_billing]
      @base_frequent_renter_points_computation  = specs[:base_frequent_renter_points]
      @bonus_frequent_renter_points_computation = specs[:bonus_frequent_renter_points]
    end

    def amount_due_for_rental(rental)
      base_price_amount         = base_price_computation.call(rental.days_rented)
      additional_billing_amount = additional_billing_computation.call(rental.days_rented)

      base_price_amount + additional_billing_amount
    end

    def frequent_renter_points_for_rental(rental)
      base_frequent_renter_points  = base_frequent_renter_points_computation.call(rental.days_rented)
      bonus_frequent_renter_points = bonus_frequent_renter_points_computation.call(rental.days_rented)

      base_frequent_renter_points + bonus_frequent_renter_points
    end
  end
end
