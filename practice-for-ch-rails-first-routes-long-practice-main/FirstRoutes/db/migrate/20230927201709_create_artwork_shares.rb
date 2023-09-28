class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.bigint :artwork_id, null: false 
      t.references :viewer, foreign_key: {to_table: :users}, null: false 
      t.timestamps
    end
    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true 
    add_foreign_key :artwork_shares, :artworks, column: :artwork_id 
  end
end
