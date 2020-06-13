require_relative '../account'
require_relative '../account_type'

RSpec.describe Account do
  let(:account) do
    type = AccountType.new(:premium)
    Account.new(type)
  end

  it 'computes interest for given days number & amount' do
    amount, days = 1000, 10
    interests_amount_due = account.interest_for_amount_days(amount, days)

    expect(interests_amount_due).to be_within(0.01).of(13.69)
  end
end
