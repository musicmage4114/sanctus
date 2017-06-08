class CreateCorporations < ActiveRecord::Migration[5.0]
  def change
    create_table :corporations, id: false do |t|
      t.integer    :corporation_id,  null: false, index: { unique: true }
      t.belongs_to :ceo,             null: false, index: { unique: true }
      t.decimal    :tax_rate,        null: false, precision: 4, scale: 3
      t.string     :ticker,          null: false, limit: 5
      t.string     :name,            null: false
      t.belongs_to :creator,         null: false
      t.belongs_to :alliance,        index: true
      t.belongs_to :faction,         index: true
      t.datetime   :creation_date
      t.integer    :member_count
      t.string     :url
      t.text       :description
      t.string     :faction_name
      t.integer    :deletion_status
      
      # urls for retrieval of corporation icon of the given size
      t.string :icon_64
      t.string :icon_128
      t.string :icon_256

      t.timestamps null: false
    end
    add_foreign_key :corporations, :characters, column: :ceo_id, primary_key: :character_id
    add_foreign_key :characters, :corporations, primary_key: :corporation_id
  end
end
