class Stats
  def self.number_of_orders_for(orders, customer_name)
    orders.select do |order|
      order.customer == Customer.with_name(customer_name)
    end.size
  end
end
