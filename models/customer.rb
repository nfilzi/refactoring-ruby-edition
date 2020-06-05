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

  def total_amount
    @total_amount ||= @rentals.map(&:amount_due).sum
  end

  def frequent_renter_points
    @frequent_renter_points ||= begin
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
