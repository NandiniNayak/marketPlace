# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Snake.names.each do |name|
    Breed.create(name: name.downcase )
    puts "#{name} created"
end

# enums:
# allows you to assign individual integer to a value:

# female: 0
# male: 1