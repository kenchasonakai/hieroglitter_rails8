class AddPostImageToPost < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :image, :string
    add_column :posts, :ogp_image, :string
  end
end
