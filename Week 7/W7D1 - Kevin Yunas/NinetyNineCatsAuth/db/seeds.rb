# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nate = User.create(user_name: "nate<3cats", password: "123456")
sarah = User.create(user_name: "sarah<3cats", password: "123456")

sarahsCat = Cat.create(name: "Sqwilliam", 
birth_date: "2000-5-5", 
color: "brown", 
sex: "M",
user_id: sarah.id)
