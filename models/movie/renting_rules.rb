require_relative 'renting_rule'
require_relative 'renting_rules/specs'

class Movie
  class RentingRules
    class << self
      def all
        @all ||= all_specs.map do |reference, specs|
          specs = { reference: reference }.merge(specs)
          ::Movie::RentingRule.new(specs)
        end
      end

      def all_specs
        SPECS
      end

      def find_by_reference(reference)
        all.find { |rule| rule.reference == reference }
      end
    end

    def initialize(rules = [])
      @rules = rules
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
