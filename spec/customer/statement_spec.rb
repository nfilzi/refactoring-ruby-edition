require_relative '../../models/customer/statement'

require_relative '../../models/customer'
require_relative '../../models/movie'
require_relative '../../models/rental'

RSpec.describe Customer::Statement do
  let(:lotr_1) { Movie.new('LOTR - The Fellowship of the Ring', 0) }
  let(:lotr_2) { Movie.new('LOTR - The Two Towers',             0) }
  let(:lotr_3) { Movie.new('LOTR - The Return of the King',     1) }

  let(:nicolas) { Customer.new('Nicolas Filzi') }
  let(:nicolas_statement) { Customer::Statement.new(nicolas) }

  describe "#to_s" do
    before(:each) do
      nicolas.add_rental(Rental.new(lotr_1, 3))
      nicolas.add_rental(Rental.new(lotr_2, 3))
      nicolas.add_rental(Rental.new(lotr_3, 3))
    end

    let(:expected_statement_string) do
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
      expect(nicolas_statement.to_s).to eq(expected_statement_string)
    end

    describe 'its title' do
      it 'contains the customer name' do
        expect(nicolas_statement.to_s).to match(/Rental Record for Nicolas Filzi/)
      end
    end

    describe 'its list of all rented movies' do
      it 'which contains the names of all rented movies' do
        expect(nicolas_statement.to_s).to match(/LOTR - The Fellowship of the Ring/)
        expect(nicolas_statement.to_s).to match(/LOTR - The Two Towers/)
        expect(nicolas_statement.to_s).to match(/LOTR - The Return of the King/)
      end

      it 'which contains the amount owed for each rented movie' do
        expect(nicolas_statement.to_s).to match(/LOTR - The Fellowship of the Ring\s+3\.5/)
        expect(nicolas_statement.to_s).to match(/LOTR - The Two Towers\s+3\.5/)
        expect(nicolas_statement.to_s).to match(/LOTR - The Return of the King\s+9/)
      end
    end

    describe 'its footer' do
      it 'which contains the amount of frequent renter points' do
        expect(nicolas_statement.to_s).to match(/You earned 4 frequent renter points/)
      end

      it 'which contains the total amound owed' do
        expect(nicolas_statement.to_s).to match(/Amount owed is 16.0/)
      end
    end
  end

  describe "#to_html" do
    before(:each) do
      nicolas.add_rental(Rental.new(lotr_1, 3))
      nicolas.add_rental(Rental.new(lotr_2, 3))
      nicolas.add_rental(Rental.new(lotr_3, 3))
    end

    let(:expected_statement_html) do
      <<~HTML
        <h1>Rental Record for Nicolas Filzi</h1>
        <ul>
          <li>LOTR - The Fellowship of the Ring - €3.5</li>
          <li>LOTR - The Two Towers - €3.5</li>
          <li>LOTR - The Return of the King - €9</li>
        </ul>
        <footer>
          <section>Amount owed is 16.0</section>
          <section>You earned 4 frequent renter points</section>
        </footer>
      HTML
    end

    describe 'its title' do
      it 'exists' do
        expect(nicolas_statement.to_html).to have_tag('h1')
      end

      it 'contains the customer name' do
        expect(nicolas_statement.to_html).to have_tag('h1') do
          with_text('Rental Record for Nicolas Filzi')
        end
      end
    end

    describe 'its list of all rented movies' do
      it 'exists' do
        expect(nicolas_statement.to_html).to have_tag('ul')
      end

      it 'contains a list of all rented movies' do
        expect(nicolas_statement.to_html).to have_tag('ul') do
          with_tag('li') do
            with_text(/LOTR - The Fellowship of the Ring/)
          end

          with_tag('li') do
            with_text(/LOTR - The Two Towers/)
          end

          with_tag('li') do
            with_text(/LOTR - The Return of the Ki/)
          end
        end
      end

      it 'contains the amount owed for each rented movie' do
        expect(nicolas_statement.to_html).to have_tag('ul') do
          with_tag('li') do
            with_text(/€3.5/)
          end

          with_tag('li') do
            with_text(/€3.5/)
          end

          with_tag('li') do
            with_text(/€9/)
          end
        end
      end

    end

    describe 'its footer' do
      it 'exists' do
        expect(nicolas_statement.to_html).to have_tag('footer')
      end

      it 'contains the total amound owed' do
        expect(nicolas_statement.to_html).to have_tag('footer') do
          with_tag('section') do
            with_text('Amount owed is 16.0')
          end
        end
      end

      it 'contains the amount of frequent renter points' do
        expect(nicolas_statement.to_html).to have_tag('footer') do
          with_tag('section') do
            with_text('You earned 4 frequent renter points')
          end
        end
      end
    end
  end
end
