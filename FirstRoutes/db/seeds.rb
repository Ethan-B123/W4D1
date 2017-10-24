# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(0..50).each do |count|
  u = User.create(username: "joe#{count}")
  a = Artwork.create(title: "title#{count}", image_url: "#{count}.com", artist_id: u.id)
  ArtworkConnection.create(viewer_id: count, artwork_id: count)
  ArtworkConnection.create(viewer_id: count + 1, artwork_id: count) unless count == 50
end
