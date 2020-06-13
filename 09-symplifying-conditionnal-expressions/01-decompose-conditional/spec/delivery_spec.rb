require_relative '../delivery'

RSpec.describe Delivery do
  context 'in summer' do
    let(:delivery) { Delivery.new(Date.new(2020, 7, 1), 10) }

    it 'computes the delivery charge based on summer rate' do
      expect(delivery.charge).to eq 8
    end
  end

  context 'in winter' do
    let(:delivery) { Delivery.new(Date.new(2020, 1, 1), 10) }

    it 'computes the delivery charge based on winter rate, including winter service charge' do
      expect(delivery.charge).to eq 17
    end
  end
end
