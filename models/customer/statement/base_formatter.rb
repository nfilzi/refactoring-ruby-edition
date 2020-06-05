class Customer
  class Statement
    class BaseFormatter
      attr_reader :statement

      def initialize(statement)
        @statement = statement
      end

      def render
        raise NotImplementedError
      end

      private

      def customer
        statement.customer
      end

      def title
        raise NotImplementedError
      end

      def body
        raise NotImplementedError
      end

      def footer
        raise NotImplementedError
      end
    end
  end
end
