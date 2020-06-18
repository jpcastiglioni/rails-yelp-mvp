# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Clreaning restaurants"
Restaurant.destroy_all

puts "Generating Restaurants"

40.times do
  Restaurant.new(
    name: Faker::Restaurant.name,
    category: %w[chinese italian japanese french belgian].sample,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number
  ).save
end

puts "Generating Reviews for the restaurants"
Restaurant.all.each do |r|
  rand(0..10).times do
    re = Review.new(
      content: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
      rating: rand(0..5)
    )
    re.restaurant = r
    re.save
  end
end

puts "Seeding finished"
