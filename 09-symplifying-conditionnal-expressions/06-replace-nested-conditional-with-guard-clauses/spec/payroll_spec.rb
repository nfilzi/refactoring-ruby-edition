require_relative '../payroll'

RSpec.describe Payroll do
  context 'when employee is dead' do
    let(:employee) { Employee.new(status: :dead) }
    let(:payroll)  { Payroll.new(employee) }

    it 'computes the payroll amount due applying rules for a dead employee' do
      expect(payroll.amount_due).to eq 0
    end
  end

  context 'when employee is separated' do
    let(:employee) { Employee.new(status: :separated) }
    let(:payroll)  { Payroll.new(employee) }

    it 'computes the payroll amount due applying rules for a separated employee' do
      expect(payroll.amount_due).to eq 0
    end
  end

  context 'when employee is retired' do
    let(:employee) { Employee.new(status: :retired) }
    let(:payroll)  { Payroll.new(employee) }

    it 'computes the payroll amount due applying rules for a retired employee' do
      expect(payroll.amount_due).to eq 0
    end
  end

  context 'when employee is currently employed' do
    let(:employee) { Employee.new(status: :employed) }
    let(:payroll)  { Payroll.new(employee) }

    it 'computes the payroll amount due applying rules for a currently employed employee' do
      expect(payroll.amount_due).to eq 0
    end
  end
end
