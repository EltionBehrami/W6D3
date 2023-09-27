# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

eltion = User.create!(username: "elitionnnn")
claudia = User.create!(username: "claudiaaaa")
jenny = User.create!(username: "jenyyyy")
john = User.create!(username: "johnnnnn")
johny = User.create!(username: "johnyyyy")

artwork1 = Artwork.create!(title: "mona lisa", artist_id: eltion.id, image_url: "www.google.com")
artwork2 = Artwork.create!(title: "starry night", artist_id: claudia.id, image_url: "www.facebook.com")
artwork3 = Artwork.create!(title: "water bottle", artist_id: jenny.id, image_url: "www.instagram.com")

artwork_share1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: eltion.id)
artwork_share2 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: claudia.id)




