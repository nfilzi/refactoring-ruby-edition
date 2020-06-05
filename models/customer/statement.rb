class Customer
  class Statement
    attr_reader :customer

    def initialize(customer)
      @customer = customer
    end

    def to_s
      @text ||= <<~TXT
        #{title}
        #{body}
        #{footer}
      TXT
      .chomp
    end

    private

    def title
      "Rental Record for #{customer.name}"
    end

    def body
      customer.rentals.map { |rental| rental_line(rental) }.join("\n")
    end

    def footer
      <<~TXT
      Amount owed is #{customer.total_amount}
      You earned #{customer.frequent_renter_points} frequent renter points
      TXT
    end

    def rental_line(rental)
      space_needed_after_move_title = " " * (50 - rental.movie.title.length)
      "\t#{rental.movie.title}#{space_needed_after_move_title}#{rental.amount_due}"
    end

  end
end
