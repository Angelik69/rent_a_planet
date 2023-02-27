class CreatePlanets < ActiveRecord::Migration[7.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.text :description
      t.integer :price_per_night
      t.integer :rating
      t.string :picture_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
