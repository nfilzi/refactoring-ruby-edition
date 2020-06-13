require_relative 'delegates/responsibilies'

class TelephoneNumber
  extend Delegates::Responsibilities
  responsible_for :area_code, :number, access_options: [:read, :write]

  attr_accessor :area_code, :number

  def telephone_number
    "(#{area_code}) #{number}"
  end
end
