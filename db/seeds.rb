# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




american = Category.where(name: "American").first_or_create(name: "American")
chinese = Category.where(name: "Chinese").first_or_create(name: "Chinese")
french = Category.where(name: "French").first_or_create(name: "French")
greek = Category.where(name: "Greek").first_or_create(name: "Greek")
indian = Category.where(name: "Indian").first_or_create(name: "Indian")
italian = Category.where(name: "Italian").first_or_create(name: "Italian")
japanese = Category.where(name: "Japanese").first_or_create(name: "Japanese")
mexican = Category.where(name: "Mexican").first_or_create(name: "Mexican")


Restaurant.where(name: "Taco Bell").first_or_create(name: "Taco Bell", description: "tacos", city: "saint paul", state: "mn", category_id: mexican.id)
Restaurant.where(name: "Taco Johns").first_or_create(name: "Taco Johns", description: "tacos", city: "roseville", state: "mn", category_id: mexican.id)
Restaurant.where(name: "Barrio").first_or_create(name: "Barrio", description: "tacos", city: "minnepolis", state: "mn", category_id: mexican.id)
Restaurant.where(name: "Taco Denver").first_or_create(name: "Taco Denver", description: "tacos", city: "denver", state: "mn", category_id: mexican.id)
Restaurant.where(name: "Jack in the Box").first_or_create(name: "Jack in the Box", description: "tacos", city: "san jose", state: "mn", category_id: mexican.id)