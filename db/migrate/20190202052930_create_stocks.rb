class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :candy, foreign_key: true
      t.references :shelf, foreign_key: true
      t.integer :quantity
      t.timestamps
    end
  end
end
