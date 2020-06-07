class Customer
  Order = Struct.new(:amount)

  def initialize(name)
    @name = name
  end

  def add_order(order)
    @orders ||= []
    @orders << order
  end

  def print_owing
    print_banner
    print_details(outstanding)
  end

  private

  def print_banner
    puts "*************************"
    puts "***** Customer Owes *****"
    puts "*************************"
  end

  def outstanding
    @orders.sum(&:amount)
  end

  def print_details(outstanding)
    puts "name: #{@name}"
    puts "amount: €#{outstanding}"
  end
end
