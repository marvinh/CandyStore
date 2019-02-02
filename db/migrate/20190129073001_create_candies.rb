class CreateCandies < ActiveRecord::Migration[5.2]
  def change
    create_table :candies do |t|
      t.string :name
      t.references :shop, foreign_key: true
      t.timestamps
    end
  end
end
