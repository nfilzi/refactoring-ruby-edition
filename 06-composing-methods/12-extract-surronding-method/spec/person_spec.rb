require "active_support/all"
require_relative '../person'

RSpec.describe Person do
  let!(:first_ancestor) do
    Person.new(
      'First ancestor',
      Date.today - 200.years,
      Date.today - 153.years
    )
  end

  let!(:second_ancestor) do
    Person.new(
      'Second ancestor',
      Date.today - 180.years,
      Date.today - 154.years,
      first_ancestor
    )
  end

  let!(:third_ancestor) do
    Person.new(
      'Third ancestor',
      Date.today - 160.years,
      Date.today - 60.years,
      second_ancestor
    )
  end

  let!(:third_ancestor_child_1) do
    Person.new(
      'Third ancestor - Child 1',
      Date.today - 125.years,
      Date.today - 25.years,
      third_ancestor
    )
  end

  let!(:third_ancestor_child_2) do
    Person.new(
      'Third ancestor - Child 2',
      Date.today - 120.years,
      Date.today - 10.years,
      third_ancestor
    )
  end

  let!(:third_ancestor_child_2_child_1) do
    Person.new(
      'Last child 1',
      Date.today - 80.years,
      nil,
      third_ancestor_child_2
    )
  end

  let!(:third_ancestor_child_2_child_2) do
    Person.new(
      'Last child 2',
      Date.today - 75.years,
      nil,
      third_ancestor_child_2
    )
  end

  let!(:third_ancestor_child_1_child_1) do
    Person.new(
      'Last child 1',
      Date.today - 75.years,
      nil,
      third_ancestor_child_1
    )
  end

  describe "#number_of_living_descendants" do
    it 'returns the correct number of living descendants' do
      expect(first_ancestor.number_of_living_descendants).to eq(3)
    end
  end

  describe "#number_of_descendants_named" do
    it 'returns the correct number of descendants with a given name' do
      expect(first_ancestor.number_of_descendants_named('Last child 1')).to eq(2)
    end
  end
end
