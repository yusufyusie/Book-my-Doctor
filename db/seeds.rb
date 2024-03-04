# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
  # db/seeds.rb

Doctor.create([
  {
    name: 'Dr. Smith',
    specialization: 'Cardiology',
    cost: 500,
    image_url: 'https://example.com/images/drsmith.jpg'
  },
  {
    name: 'Dr. Johnson',
    specialization: 'Neurology',
    cost: 600,
    image_url: 'https://example.com/images/drjohnson.jpg'
  },
  {
    name: 'Dr. Lee',
    specialization: 'Orthopedics',
    cost: 400,
    image_url: 'https://example.com/images/drlee.jpg'
  }
])
