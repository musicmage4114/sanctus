class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters, id: false do |t|
      t.integer :character_id, null: false, index: { unique: true }
      t.belongs_to :corporation, null: false, index: true
      t.belongs_to :alliance, index: true
      t.string :name, null: false
      t.datetime :birthday, null: false
      t.decimal :security_status
      t.belongs_to :race, null: false
      t.belongs_to :bloodline, null: false
      t.belongs_to :ancestry
      t.text :description
      t.datetime :last_clone_jump
      t.integer :gender, null: false, default: 1
      
      # urls for retrieval of character portrait of the given size
      t.string :portrait_64
      t.string :portrait_128
      t.string :portrait_256
      t.string :portrait_512
      
      # home station
      # supplied parameters: location_id, location_type
      t.references :home_station, polymorphic: true, index: true
      
      # current location
      # supplied parameters: location_id, location_type
      t.references :current_location, polymorphic: true, index: { name: 'current_location_index' }

      t.timestamps null: false
    end
  end
end