# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Character.create([
  {
    name: 'Achille'
  },
  {
    name: 'Bellerophon'
  },
  {
    name: 'Hercules'
  },
  {
    name: 'Persée'
  },
  {
    name: 'Ulysse'
  },
  {
    name: 'Artémis'
  }]
)

Weapon.create([
  {
    name: 'Trident de Poséidon',
    experience_price: 150.0,
    additional_power: 0.1
  },
  {
    name: 'Botte de Hermes',
    experience_price: 350.0,
    additional_power: 0.4
  },
  {
    name: 'Char de Helios',
    experience_price: 650.0,
    additional_power: 0.5
  },
  {
    name: 'Faux de Deimos',
    experience_price: 200.0,
    additional_power: 0.2
  }
])