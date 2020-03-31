Artist.destroy_all

10.times do
  Artist.create(name: Faker::Name.name, age: rand(1..100), bio: Faker::Hipster.sentence)
end

puts "File has been seeded! 🍀"