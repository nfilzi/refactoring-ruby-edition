require_relative '../../order/item_line'

RSpec.describe Order::ItemLine do

  describe "#price" do
    let(:order_item_line) { Order::ItemLine.new(12, 100) }

    it 'computes the correct base price' do
      expect(order_item_line.base_price).to eq(1200)
    end

    context 'with base price > 1000' do
      let(:order_item_line) { Order::ItemLine.new(12, 100) }

      it 'applies the correct discount factor' do
        expect(order_item_line.discount_factor).to eq(0.95)
      end

      it 'computes the correct final price' do
        expect(order_item_line.price).to eq(1140)
      end
    end

    context 'with base price < 1000' do
      let(:order_item_line) { Order::ItemLine.new(9, 100) }

      it 'applies the correct discount factor' do
        expect(order_item_line.discount_factor).to eq(0.98)
      end

      it 'computes the correct final price' do
        expect(order_item_line.price).to eq(882)
      end
    end
  end
end
