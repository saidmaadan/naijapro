class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :type
      t.text :summary
      t.integer :bedroom
      t.integer :bathroom
      t.string :year_built
      t.string :rent_price
      t.string :price
      t.string :short_stay_price
      t.string :garage_size
      t.string :number_of_floors
      t.string :square_feet
      t.string :location
      t.float :latitude
      t.float :longitude
      t.string :property_features
      t.string :lot_features
      t.string :community_features
      t.string :parking_type
      t.string :video_url
      t.string :slug
      t.integer :status, default: 1
      t.boolean :active, default: true
      t.integer :featured, default: 0
      t.references :agent, null: false, foreign_key: true
      t.references :property_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
