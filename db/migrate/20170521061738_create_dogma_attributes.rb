class CreateDogmaAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :dogma_attributes, id: false do |t|
      t.integer :attribute_id, null: false, index: { unique: true }
      t.float :default_value
      t.text :description
      t.string :display_name
      t.belongs_to :icon, index: true
      t.string :name
      t.integer :unit_id, index: true
      
      # enum - supplied parameter: boolean - high_is_good; true -> 1 -> high, false -> 0 -> low
      t.integer :good, index: true
      # enum - supplied parameter: boolean - stackable; true -> 1 -> stackable, false -> 0 -> unstackable
      t.integer :stacking, index: true
      # enum - supplied parameter: boolean - published; true -> 1 -> published, false -> 0 -> unpublished
      t.integer :usage, null: false, default: 1, index: true
    end
  end
end
