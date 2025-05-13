class RemoveImageFromPost < ActiveRecord::Migration[8.0]
  def change
    remove_column :posts, :image, :string
  end
end
