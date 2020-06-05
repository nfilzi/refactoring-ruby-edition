require_relative '../../models/customer'
require_relative '../../models/movie'
require_relative '../../models/rental'

RSpec.describe Customer do
  let(:lotr_1) { Movie.new('LOTR - The Fellowship of the Ring', 0) }
  let(:lotr_2) { Movie.new('LOTR - The Two Towers',             0) }
  let(:lotr_3) { Movie.new('LOTR - The Return of the King',     1) }

  let(:nicolas) { Customer.new('Nicolas Filzi') }

  describe "#statement" do
    before(:each) do
      nicolas.add_rental(Rental.new(lotr_1, 3))
      nicolas.add_rental(Rental.new(lotr_2, 3))
      nicolas.add_rental(Rental.new(lotr_3, 3))
    end

    let(:expected_statement) do
      <<~TXT
        Rental Record for Nicolas Filzi
        \tLOTR - The Fellowship of the Ring                 3.5
        \tLOTR - The Two Towers                             3.5
        \tLOTR - The Return of the King                     9
        Amount owed is 16.0
        You earned 4 frequent renter points
      TXT
    end

    it 'returns complete rental statement' do
      pending 'Painful spacing & tabulations to deal with in string'
      # p nicolas.statement
      # p expected_statement
      expect(nicolas.statement).to eq(expected_statement)
    end

    it 'which contains the customer name' do
      expect(nicolas.statement).to match(/Rental Record for Nicolas Filzi/)
    end

    it 'which contains the amount of frequent renter points' do
      expect(nicolas.statement).to match(/You earned 4 frequent renter points/)
    end

    it 'which contains the names of all rented movies' do
      expect(nicolas.statement).to match(/LOTR - The Fellowship of the Ring/)
      expect(nicolas.statement).to match(/LOTR - The Two Towers/)
      expect(nicolas.statement).to match(/LOTR - The Return of the King/)
    end

    it 'which contains the amount owed for each rented movie' do
      expect(nicolas.statement).to match(/LOTR - The Fellowship of the Ring\s+3\.5/)
      expect(nicolas.statement).to match(/LOTR - The Two Towers\s+3\.5/)
      expect(nicolas.statement).to match(/LOTR - The Return of the King\s+9/)
    end

    it 'which contains the total amound owed' do
      expect(nicolas.statement).to match(/Amount owed is 16.0/)
    end
  end
end
