class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts, id: false do |t|
      t.belongs_to :diplomacy, polymorphic: true, null: false, index: true
      t.belongs_to :character, null: false, index: true
      t.integer    :blocklist, null: false, default: 0, index: true
      t.integer    :watchlist, null: false, default: 0, index: true
      t.belongs_to :label,     index: true
      t.float      :standing

      t.timestamps null: false
    end
    add_foreign_key :contacts, :characters, primary_key: :character_id
  end
end
