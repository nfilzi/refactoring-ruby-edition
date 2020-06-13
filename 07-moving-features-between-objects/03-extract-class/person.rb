require 'delegates'
require_relative 'telephone_number'

class Person
  extend Delegates
  delegate  *TelephoneNumber.delegated_responsibilities,
    to:     :office_telephone,
    prefix: :office

  attr_reader :name, :office_telephone

  def initialize
    @office_telephone = TelephoneNumber.new
  end

  def telephone_number
    @office_telephone.telephone_number
  end
end
