require_relative 'renting_rule'

class Movie
  class RentingRules
    def self.all
      {
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
        }
      }
    end

    def self.find_by_reference(reference)
      rule_specs = all[reference]

      if rule_specs
        specs = { reference: reference }.merge(rule_specs)
        ::Movie::RentingRule.new(specs)
      else
        nil
      end
    end

    def initialize
      @rules = []
    end

    def add_rule(rule)
      @rules << rule
    end

    def amount_due_for_rental(rental)
      @rules.sum { |rule| rule.amount_due_for_rental(rental) }
    end

    def frequent_renter_points_for_rental(rental)
      @rules.sum { |rule| rule.frequent_renter_points_for_rental(rental) }
    end
  end
end
