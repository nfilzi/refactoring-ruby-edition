class Customer
  class Statement
    class PlainTextFormatter
      attr_reader :statement

      def initialize(statement)
        @statement = statement
      end

      def render
        @text ||= <<~TXT
          #{title}
          #{body}
          #{footer}
        TXT
        .chomp
      end

      private

      def customer
        statement.customer
      end

      def title
        "Rental Record for #{customer.name}"
      end

      def body
        customer.rentals.map { |rental| rental_line(rental) }.join("\n")
      end

      def footer
        <<~TXT
        Amount owed is #{customer.total_amount_due}
        You earned #{customer.total_frequent_renter_points} frequent renter points
        TXT
      end

      def rental_line(rental)
        "\t" + rental.movie.title + rental_line_spacer_after_movie_title(rental) + rental.amount_due.to_s
      end

      def rental_line_spacer_after_movie_title(rental)
        " " * (50 - rental.movie.title.length)
      end
    end
  end
end
