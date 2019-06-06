# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Character.create([
  {
    name: 'Hero'
  },
  {
    name: 'Monster'
  }]
)

Weapon.create([
  {
    name: 'Weapon1',
    experience_price: 150.0,
    additional_power: 0.1
  },
  {
    name: 'Weapon2',
    experience_price: 250.0,
    additional_power: 0.2
  }
])