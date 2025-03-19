class AddTranslatedTextToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :translated_text, :string
  end
end
