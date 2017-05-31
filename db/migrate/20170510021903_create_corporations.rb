class CreateCorporations < ActiveRecord::Migration[5.0]
  def change
    create_table :corporations, id: false do |t|
      t.integer :corporation_id, null: false, index: { unique: true }
      t.belongs_to :alliance, index: true
      t.belongs_to :faction, index: true
      t.string :name, null: false
      t.string :ticker, null: false, limit: 5
      t.decimal :tax_rate, null: false, precision: 4, scale: 3
      t.datetime :creation_date
      t.integer :member_count
      t.belongs_to :ceo, null: false, index: { unique: true }
      t.belongs_to :creator, null: false
      t.string :url
      t.text :description
      t.string :faction_name
      
      # urls for retrieval of corporation icon of the given size
      t.string :icon_64
      t.string :icon_128
      t.string :icon_256

      # enum - supplied parameter: boolean - is_deleted
      # true -> 1 -> closed, false -> 0 -> open
      t.integer :deletion_status, index: true

      t.timestamps null: false
    end
    # foreign key: corporations -> characters; column: ceo_id, primary key: character_id
    # foreign key: corporations -> alliances; primary key: alliance_id
  end
end
