require 'erb'
require_relative 'base_formatter'

class Customer
  class Statement
    class HtmlFormatter < BaseFormatter

      def render
        <<~HTML
          #{title}
          #{body}
          #{footer}
        HTML
      end

      private

      def title
        <<~HTML
          <h1>Rental Record for #{customer.name}</h1>
        HTML
      end

      def body
        html = <<-HTML
          <ul>
            <% customer.rentals.map do |rental| %>
              <%= rental_line(rental) %>
            <% end %>
          </ul>
        HTML

        ERB.new(html).result(binding)
      end

      def footer
        <<~HTML
          <footer>
            <section>Amount owed is #{customer.total_amount_due}</section>
            <section>You earned #{customer.total_frequent_renter_points} frequent renter points</section>
          </footer>
        HTML
      end

      def rental_line(rental)
        <<~HTML
          <li>#{rental.movie.title} €#{rental.amount_due.to_s}</li>
        HTML
      end
    end
  end
end
