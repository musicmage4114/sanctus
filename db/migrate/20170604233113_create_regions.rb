class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions, id: false do |t|
      t.integer :region_id, null: false, index: { unique: true }
      t.string :name, null: false
      t.text :description
    end
  end
end
