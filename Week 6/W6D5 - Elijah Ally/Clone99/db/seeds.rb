# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

max = Cat.create!(birth_date: '2014/02/15', name: 'Max', color: 'golden', sex: 'M', description: 'Liked lasers!')
miso = Cat.create!(birth_date: '2019/04/22', name: 'Miso', color: 'gray', sex: 'F', description: 'Purrs a lot')

d1 = CatRentalRequest.create!(cat_id: max.id, start_date: '2019/1/1', end_date: '2019/2/1', status: 'APPROVED')