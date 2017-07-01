class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks, id: false do |t|
      t.integer    :bookmark_id,     null: false, index: { unique: true }
      t.belongs_to :creator,         null: false, index: true
      t.belongs_to :solar_system,    null: false, index: true
      t.datetime   :create_date,     null: false
      t.belongs_to :folder,          index: true
      t.belongs_to :location_type,   index: true
      t.belongs_to :item,            index: true
      t.belongs_to :owner,           polymorphic: true, index: true
      t.text       :memo
      t.text       :note
      t.float :x
      t.float :y
      t.float :z
    end
    add_foreign_key :bookmarks, :characters,    column: :creator_id,
                                                primary_key: :character_id
    add_foreign_key :bookmarks, :solar_systems, primary_key: :system_id
    add_foreign_key :bookmarks, :items,         column: :location_type_id,
                                                primary_key: :type_id
  end
end
