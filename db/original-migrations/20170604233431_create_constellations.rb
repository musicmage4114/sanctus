class CreateConstellations < ActiveRecord::Migration[5.1]
  def change
    create_table :constellations, id: false do |t|
      t.integer :constellation_id, null: false, index: { unique: true }
      t.belongs_to :region,        null: false, index: true
      t.string :name,              null: false
      
      # coordinates
      t.float :x
      t.float :y
      t.float :z
    end
    add_foreign_key :constellations, :regions, primary_key: :region_id
  end
end
