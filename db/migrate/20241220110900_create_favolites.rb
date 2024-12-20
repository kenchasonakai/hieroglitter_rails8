class CreateFavolites < ActiveRecord::Migration[8.0]
  def change
    create_table :favolites do |t|
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end
  end
end
