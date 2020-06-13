class Stats
  def self.number_of_orders_for(orders, customer_name)
    orders.select {|order| order.customer_name == customer_name }.size
  end
end
