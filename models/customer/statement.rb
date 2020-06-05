require_relative 'statement/plain_text_formatter'
require_relative 'statement/html_formatter'

class Customer
  class Statement
    attr_reader :customer

    def initialize(customer)
      @customer = customer
    end

    def to_s
      PlainTextFormatter.new(self).render
    end

    def to_html
      HtmlFormatter.new(self).render
    end
  end
end
