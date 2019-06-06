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
    name: 'Elf Sword',
    experience_price: 150.0,
    additional_power: 0.1
  },
  {
    name: 'Fire Sword',
    experience_price: 350.0,
    additional_power: 0.4
  },
  {
    name: 'Space Sword',
    experience_price: 650.0,
    additional_power: 1
  }
])