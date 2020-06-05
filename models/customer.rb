require_relative 'customer/statement'

class Customer
  attr_reader :name, :rentals

  def initialize(name)
    @name    = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def total_amount_due
    @total_amount_due ||= @rentals.sum(&:amount_due)
  end

  def total_frequent_renter_points
    @total_frequent_renter_points ||= begin
      @rentals.map { |rental| rental.total_frequent_renter_points }.sum
    end
  end

  def statement
    Customer::Statement.new(self)
  end

  def statement_content
    statement.to_s
  end
end
