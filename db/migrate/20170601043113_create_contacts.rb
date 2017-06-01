class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts, id: false do |t|
      t.belongs_to :character, null: false, index: true
      t.belongs_to :diplomacy, polymorphic: true, null: false, index: true
      t.belongs_to :label, index: true
      t.float :standing
      
      # enum - supplied parameter: boolean - is_blocked
      # true -> 1 -> blocked, false -> 0 -> not_blocked
      t.integer :blocklist, null: false, default: 0, index: true
      # enum - supplied parameter: boolean - is_watched
      # true -> 1 -> watched, false -> 0 -> not_watched
      t.integer :watchlist, null: false, default: 0, index: true

      t.timestamps
    end
    add_foreign_key :contacts, :characters, primary_key: :character_id
  end
end
