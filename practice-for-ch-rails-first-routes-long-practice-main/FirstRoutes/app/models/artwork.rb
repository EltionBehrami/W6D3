class Artwork < ApplicationRecord
    validates :artist_id, presence: true
    validates :image_url, presence: true, uniqueness: true 

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShares

    has_many :shared_viewers,
        through: :shares,
        source: :viewer
end