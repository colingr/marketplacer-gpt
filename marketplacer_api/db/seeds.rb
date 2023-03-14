# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
products = [
  {
    "uuid": 1411,
    "name": "Jockey Wheels - Orange",
    "price": "15.39"
  },
  {
    "uuid": 23881,
    "name": "Chain Ring 146mm",
    "price": "65.95"
  },
  {
    "uuid": 13008,
    "name": "Carbon Brake Pads",
    "price": "92.00"
  },
  {
    "uuid": 9101,
    "name": "Front Derailleur - 34.9mm",
    "price": "31.22"
  }
]

products.each do |product|
  Product.create(product)
end
