require_relative 'movie'
require_relative 'customer'
require_relative 'rental'

lotr_1 = Movie.new('LOTR - The Fellowship of the Ring', 0)
lotr_2 = Movie.new('LOTR - The Two Towers',             0)
lotr_3 = Movie.new('LOTR - The Return of the King',     1)

nicolas = Customer.new('Nicolas Filzi')
thomas  = Customer.new('Thomas Pariente')

nicolas.add_rental(Rental.new(lotr_1, 3))
nicolas.add_rental(Rental.new(lotr_2, 3))
nicolas.add_rental(Rental.new(lotr_3, 3))

thomas.add_rental(Rental.new(lotr_1, 1))
thomas.add_rental(Rental.new(lotr_2, 1))
thomas.add_rental(Rental.new(lotr_3, 1))

thomas.add_rental(Rental.new(lotr_1, 1))
thomas.add_rental(Rental.new(lotr_2, 2))
thomas.add_rental(Rental.new(lotr_3, 3))

thomas.add_rental(Rental.new(lotr_1, 7))
thomas.add_rental(Rental.new(lotr_2, 7))
thomas.add_rental(Rental.new(lotr_3, 7))

puts nicolas.statement
puts "*" * 20

puts thomas.statement
