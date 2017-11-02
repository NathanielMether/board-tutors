class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :profile_image_data
      t.string :board_sport
      t.integer :price
      t.string :locations
      t.text :bio
      t.text :description

      t.timestamps
    end
  end
end
