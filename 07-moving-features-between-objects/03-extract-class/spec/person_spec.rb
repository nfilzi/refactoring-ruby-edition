require_relative '../person'

RSpec.describe Person do
  let(:person) do
    person = Person.new
    person.office_area_code = '480'
    person.office_number    = '200-7582'
    person
  end

  it 'returns a phone number' do
    expect(person.telephone_number).to eq('(480) 200-7582')
  end
end
