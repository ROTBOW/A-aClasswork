# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

ian = User.new(username: 'Ian').save
sarah = User.new(username: 'Sarah').save
john = User.new(username: 'John').save

picasso = Artwork.new(title: 'The day with the dog', image_url: 'thedog.png', artist_id: 2).save
pistachio = Artwork.new(title: 'Nuts', image_url: 'squirrelday.jpeg', artist_id: 3).save
penny = Artwork.new(title: 'Cents', image_url: 'stnec.png', artist_id: 2).save

ian1 = ArtworkShare.new(artwork_id: 1, viewer_id: 1).save
ian1 = ArtworkShare.new(artwork_id: 2, viewer_id: 1).save
ian1 = ArtworkShare.new(artwork_id: 3, viewer_id: 1).save
john1 = ArtworkShare.new(artwork_id: 3, viewer_id: 3).save

