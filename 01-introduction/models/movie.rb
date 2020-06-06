require_relative 'movie/renting_rules'

class Movie
  REGULAR     = 0
  NEW_RELEASE = 1
  CHILDRENS   = 2

  attr_reader   :title, :renting_rules

  def initialize(title)
    @title         = title
    @renting_rules = RentingRules.new
  end

  def add_renting_rule(rule_reference)
    renting_rule = RentingRules.find_by_reference(rule_reference)
    @renting_rules.add_rule(renting_rule)
  end
end
