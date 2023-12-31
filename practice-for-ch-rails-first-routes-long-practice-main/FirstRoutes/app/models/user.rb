class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true 
    has_many :artworks,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy, 
        inverse_of: :artist

    has_many :shares,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare, 
        inverse_of: :viewer 

    
    has_many :comments, 
        primary_key: :id, 
        foreign_key: :author_id, 
        class_name: :Comment,
        dependent: :destroy, 
        inverse_of: :author 


    has_many :shared_artworks,
        through: :shares,
        source: :artwork
end