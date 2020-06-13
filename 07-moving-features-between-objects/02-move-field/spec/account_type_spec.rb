RSpec.describe AccountType do
  context 'when premium' do
    let(:account_type) { AccountType.new(:premium) }

    it 'set correct interest rate' do
      expect(account_type.interest_rate).to be(0.5)
    end
  end

  context 'when classic' do
    let(:account_type) { AccountType.new(:classic) }

    it 'set correct interest rate' do
      expect(account_type.interest_rate).to be(1.2)
    end
  end
end
