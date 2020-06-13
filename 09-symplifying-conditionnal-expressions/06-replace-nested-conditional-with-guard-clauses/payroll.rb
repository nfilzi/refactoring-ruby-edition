require 'pry-byebug'

class Employee
  def initialize(status:)
    @status = status
  end

  def dead?
    @status == :dead
  end

  def separated?
    @status == :separated
  end

  def retired?
    @status == :retired
  end

  def currently_employed?
    @status == :currently_employed
  end
end

class Payroll
  def initialize(employee)
    @dead               = employee.dead?
    @separated          = employee.separated?
    @retired            = employee.retired?
    @currently_employed = employee.dead?
  end

  def amount_due
    return dead_amount_due      if @dead
    return separated_amount_due if @separated

    if @retired
      retired_amount
    else
      currently_employed_amount
    end
  end

  def dead_amount_due
    0
  end

  def separated_amount_due
    0
  end

  def retired_amount
    0
  end

  def currently_employed_amount
    0
  end
end
