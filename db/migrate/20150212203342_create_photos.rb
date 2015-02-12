class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.integer :flickr_id
      t.text :description

      t.timestamps
    end
  end
end
