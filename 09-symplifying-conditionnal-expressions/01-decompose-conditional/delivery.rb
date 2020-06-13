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
    in_winter? ? winter_charge : summer_charge
  end

  private

  def in_summer?
    !in_winter?
  end

  def in_winter?
    date < SUMMER_START || date > SUMMER_END
  end

  def winter_charge
    quantity * @winter_rate + @winter_service_charge
  end

  def summer_charge
    quantity * @summer_rate
  end
end
