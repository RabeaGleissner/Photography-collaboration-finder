class AddImageAndProfileurlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :profileurl, :string
  end
end
