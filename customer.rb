class Customer
  attr_reader :name

  def initialize(name)
    @name    = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Record for #{@name}\n"

    @rentals.each do |element|
      this_amount = 0

      # compute amount for each rental
      case element.movie.price_code
      when Movie::REGULAR
        this_amount += 2
        this_amount += (element.days_rented - 2) * 1.5 if element.days_rented > 2

      when Movie::NEW_RELEASE
        this_amount += element.days_rented * 3

      when Movie::CHILDRENS
        this_amount += 1.5
        this_amount += (element.days_rented - 3) * 1.5 if element.days_rented > 3
      end

      # add frequent renter points
      frequent_renter_points += 1
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      # show figures for this rental
      space_needed_after_move_title = 50 - element.movie.title.length
      result += "\t" + element.movie.title + " " * space_needed_after_move_title + this_amount.to_s + "\n"
      total_amount += this_amount
    end

    # show footer lines
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points"
    result
  end
end
