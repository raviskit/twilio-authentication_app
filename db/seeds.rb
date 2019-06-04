# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([
  {name: "Mobiles"},
  {name: "Laptops"},
  {name: "Televisions"},
  {name: "Network Components"},
  {name: "Camera"},
  {name: "Tablets"}
  ])

  User.create(email: 'admin-agent@gmail.com', password: "admin@123", role: "admin", phone_number: "987654321", country_code: "91")

  puts "Use email: admin-agent@gmail.com and password: admin@123 for admin"
