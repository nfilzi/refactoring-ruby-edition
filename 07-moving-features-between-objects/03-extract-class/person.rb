class Person
  attr_reader   :name
  attr_accessor :office_area_code, :office_number

  def telephone_number
    "(#{@office_area_code}) #{@office_number}"
  end
end
