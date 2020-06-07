require_relative '../../order/item_line'

RSpec.describe Order::ItemLine do

  describe "#price" do
    context 'with total price for line > 1000' do
      let(:order_item_line) { Order::ItemLine.new(12, 100) }

      it 'computes the correct price' do
        expect(order_item_line.price).to eq(1140)
      end
    end

    context 'with total price for line < 1000' do
      let(:order_item_line) { Order::ItemLine.new(9, 100) }

      it 'computes the correct price' do
        expect(order_item_line.price).to eq(882)
      end
    end
  end
end
