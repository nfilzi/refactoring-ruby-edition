require_relative 'movie/regular_price'
require_relative 'movie/new_release_price'
require_relative 'movie/children_price'

class Movie
  attr_reader   :title
  attr_accessor :price

  def initialize(title, price)
    @title, @price = title, price
  end

  def amount_due_for(days_rented)
    @price.amount_due(days_rented)
  end

  def total_frequent_renter_points(days_rented)
    @price.total_frequent_renter_points(days_rented)
  end
end
