require_relative 'statement/plain_text_formatter'

class Customer
  class Statement
    attr_reader :customer

    def initialize(customer)
      @customer = customer
    end

    def to_s
      PlainTextFormatter.new(self).render
    end
  end
end
