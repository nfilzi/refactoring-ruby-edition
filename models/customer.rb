class Customer
  attr_reader :name

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
      rentals_points = @rentals.map do |rental|
        1 + rental.bonus_frequent_renter_points
      end

      rentals_points.sum
    end
  end

  def statement
    text = statement_title

    @rentals.each do |element|
      text += statement_line_for_rental(element)
    end

    text += statement_footer(total_amount, frequent_renter_points)
    text
  end

  def statement_title
    "Rental Record for #{@name}\n"
  end

  def statement_footer(total_amount, frequent_renter_points)
    <<~TXT
    Amount owed is #{total_amount}\n"
    You earned #{frequent_renter_points} frequent renter points
    TXT
  end

  def statement_line_for_rental(rental)
    space_needed_after_move_title = " " * (50 - rental.movie.title.length)
    "\t#{rental.movie.title}#{space_needed_after_move_title}#{rental.amount_due}\n"
  end
end
