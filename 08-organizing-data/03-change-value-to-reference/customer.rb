class Customer
  attr_reader :name

  class << self
    def store_instance(instance)
      @instances ||= {}
      @instances[instance.name] ||= instance
    end

    def instances
      @instances
    end

    def create(name)
      store_instance(Customer.new(name))
    end

    def with_name(name)
      instances[name]
    end
  end

  def initialize(name)
    @name = name
  end
end
