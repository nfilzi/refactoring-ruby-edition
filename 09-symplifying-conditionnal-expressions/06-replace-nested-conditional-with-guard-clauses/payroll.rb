require 'pry-byebug'

class Employee
  def initialize(status:)
    @status = status
  end

  def amount_due
    return dead_amount_due      if dead?
    return separated_amount_due if separated?
    return retired_amount       if retired?

    return currently_employed_amount
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
    @employee = employee
  end

  def amount_due
    @employee.amount_due
  end
end
