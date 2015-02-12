class AddForeignKeysToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :user_id, :integer
    add_column :albums, :photo_id, :integer
  end
end
