class ChangeFlickrIdToString < ActiveRecord::Migration
  def up
    change_column :albums, :flickr_id, :string
    change_column :photos, :flickr_id, :string
  end

  def down
    change_column :albums, :flickr_id, :integer
    change_column :photos, :flickr_id, :integer
  end
end
