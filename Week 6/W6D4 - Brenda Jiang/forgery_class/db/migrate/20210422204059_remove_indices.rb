class RemoveIndices < ActiveRecord::Migration[5.2]
  def change
    remove_index :artworks, [:artist_id, :title]
    remove_index :artwork_shares, [:artwork_id, :viewer_id]

    add_index :artworks, [:artist_id, :title], unique: true
    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
  end
end
