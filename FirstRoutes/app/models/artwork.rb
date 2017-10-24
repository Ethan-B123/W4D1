class Artwork < ApplicationRecord
  validates :title, presence: true, uniqueness:
    { scope: :artist_id, message: "title names must be unique to user" }
  validates :image_url, presence: true
  validates :artist_id, presence: true

  belongs_to :artist,
  foreign_key: :artist_id,
  class_name: :User

  has_many :shares,
  foreign_key: :artwork_id,
  class_name: :ArtworkShare

  has_many :viewers,
  through: :shares,
  source: :viewer

end
