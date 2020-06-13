require_relative 'customer'
class Order
  attr_reader :customer

  def initialize(customer_name)
    @customer = Customer.new(customer_name)
  end

  def customer_name
    @customer.name
  end

  def customer=(new_customer_name)
    @customer = Customer.new(new_customer_name)
  end
end
