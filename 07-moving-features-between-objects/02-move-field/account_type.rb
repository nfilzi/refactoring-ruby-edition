class AccountType
  attr_reader :kind, :interest_rate

  def initialize(kind)
    @kind = kind
    set_interest_rate
  end

  def set_interest_rate
    @interest_rate = case kind
    when :premium then 0.5
    when :classic then 1.2
    end
  end
end
