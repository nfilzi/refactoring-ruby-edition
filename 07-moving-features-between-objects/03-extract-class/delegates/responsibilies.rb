module Delegates
  module Responsibilities
    def responsible_for(*methods, access_options: [])
      @responsibilities = methods.map do |method|
        access_options.map do |option|
          case option
          when :read  then method
          when :write then "#{method}=".to_sym
          end
        end
      end.flatten
    end

    def delegated_responsibilities
      @responsibilities
    end
  end
end
