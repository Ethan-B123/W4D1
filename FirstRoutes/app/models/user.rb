class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
  foreign_key: :artist_id

  has_many :shares,
  foreign_key: :viewer_id,
  class_name: :ArtworkShare

  has_many :viewed_works,
  through: :shares,
  source: :artwork

end
