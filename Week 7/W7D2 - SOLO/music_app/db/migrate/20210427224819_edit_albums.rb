class EditAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :live_or_studio
    add_column :albums, :live_or_studio, :string, null: false
  end
end
