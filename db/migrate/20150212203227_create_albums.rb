class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :flickr_id
      t.text :description
      t.integer :photo_count

      t.timestamps
    end
  end
end
