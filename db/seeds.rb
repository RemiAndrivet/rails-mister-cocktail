# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# require 'json' #parse your url json into a ruby hash, not mandatory because you have it in the gems of rails
require 'open-uri' #that allows ypou to open an url and read it

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

puts "1.Destroying ingredients"

Ingredient.destroy_all

puts "2. Opening JSON and parsing it into a ruby hash"
json_string = open(url).read

ruby_hash = JSON.parse(json_string)
p ruby_hash

puts "3.Creating ingredients"
final_array = []
 ruby_hash["drinks"].each do |ingredient_baby_hash|
  final_array << Ingredient.create!(name: ingredient_baby_hash["strIngredient1"] )
end

final_array
puts "4. finished"
puts "5. You have #{Ingredient.count} ingredients seeded"