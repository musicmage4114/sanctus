class CreateBloodlines < ActiveRecord::Migration[5.1]
  def change
    create_table :bloodlines, id: false do |t|
      t.integer :bloodline_id, null: false, index: { unique: true }
      t.belongs_to :race, null: false, index: true
      t.belongs_to :corporation, index: true
      t.belongs_to :ship_type, index: true
      t.string :name
      t.text :description
      
      # attributes
      t.integer :charisma
      t.integer :intelligence
      t.integer :memory
      t.integer :perception
      t.integer :willpower
    end
    add_foreign_key :bloodlines, :corporations, primary_key: :corporation_id
  end
end
