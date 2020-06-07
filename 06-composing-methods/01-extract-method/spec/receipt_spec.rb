require_relative '../customer'

RSpec.describe Customer do
  let(:customer) { Customer.new('Nicolas Filzi') }
  let(:orders) do
    [
      Customer::Order.new(10),
      Customer::Order.new(50),
      Customer::Order.new(20)
    ]
  end

  before(:each) do
    orders.each {|order| customer.add_order(order) }
  end

  describe "#print_owing" do
    it 'prints a header' do
      expect { customer.print_owing }.to output(/Customer Owes/).to_stdout
    end

    it 'prints customer name' do
      expect { customer.print_owing }.to output(/Nicolas Filzi/).to_stdout
    end

    it 'prints outstanding amount' do
      expect { customer.print_owing }.to output(/€80/).to_stdout
    end
  end
end
