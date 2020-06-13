require 'date'
require 'pry-byebug'

class Delivery
  SUMMER_START = Date.new(2020, 6, 1)
  SUMMER_END   = Date.new(2020, 9, 1)

  attr_reader :quantity, :date

  def initialize(date, quantity)
    @summer_rate = 0.8
    @winter_rate = 1.2
    @winter_service_charge = 5

    @quantity = quantity
    @date     = date
  end

  def charge
    if date < SUMMER_START || date > SUMMER_END
      quantity * @winter_rate + @winter_service_charge
    else
      quantity * @summer_rate
    end
  end
end
