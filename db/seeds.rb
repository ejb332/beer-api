# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  name = Faker::Beer.name
  style = Faker::Beer.style
  hop = Faker::Beer.hop
  yeast = Faker::Beer.yeast
  malts = Faker::Beer.malts
  ibu = Faker::Beer.ibu
  alcohol = Faker::Beer.alcohol
  blg = Faker::Beer.blg
  Beer.create(
    name: name,
    style: style,
    hop: hop,
    yeast: yeast,
    malts: malts,
    ibu: ibu,
    alcohol: alcohol,
    blg: blg
  )
end