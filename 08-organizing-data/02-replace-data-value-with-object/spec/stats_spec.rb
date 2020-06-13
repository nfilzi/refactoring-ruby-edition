require_relative '../stats'
require_relative '../order'

RSpec.describe Stats do
  let(:nicolas_order_1)      { Order.new('Nicolas') }
  let(:nicolas_order_2)      { Order.new('Nicolas') }
  let(:nicolas_order_3)      { Order.new('Nicolas') }
  let(:nicolas_order_4)      { Order.new('Nicolas') }
  let(:other_customer_order) { Order.new('Cécile') }

  let(:orders) do
    [
      nicolas_order_1,
      nicolas_order_2,
      nicolas_order_3,
      nicolas_order_4,
      other_customer_order
    ]
  end

  it 'returns the number of orders for a specific customer' do
    expect(Stats.number_of_orders_for(orders, 'Nicolas')).to eq(4)
  end
end
