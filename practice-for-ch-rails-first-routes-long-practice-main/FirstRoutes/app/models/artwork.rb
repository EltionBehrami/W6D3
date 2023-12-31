class Artwork < ApplicationRecord
    validates :artist_id, presence: true
    validates :image_url, presence: true, uniqueness: true 
    validates_uniqueness_of  :artist_id, scope: :title    

    def self.find_all_artworks(user_id)
        # Artwork.joins("
        # LEFT OUTER JOIN 
        #     artwork_shares ON artwork_shares.artwork_id = artworks.id")
        #     .where("artworks.artist_id = ? OR artwork_shares.viewer_id = ?", user_id, user_id)
        #     .distinct


        Artwork.left_outer_joins(:shares)
                .where("artworks.artist_id = ? OR artwork_shares.viewer_id = ?", user_id, user_id)  
                .distinct
    end

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        inverse_of: :artwork,
        dependent: :destroy

    has_many :comments, 
        primary_key: :id,   
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy,
        inverse_of: :artwork  

    has_many :shared_viewers,
        through: :shares,
        source: :viewer
end