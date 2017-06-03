class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks, id: false do |t|
      t.integer    :bookmark_id, null: false, index: { unique: true }
      t.belongs_to :creator,     null: false, index: true
      t.belongs_to :location,    null: false, index: true
      t.datetime   :create_date, null: false
      t.belongs_to :folder,      index: true
      t.belongs_to :type,        index: true
      t.belongs_to :item,        index: true
      t.belongs_to :owner,       polymorphic: true, index: true
      t.text       :memo
      t.text       :note
      
      # coordinates relative to solar system's sun
      t.float :x
      t.float :y
      t.float :z
    end
    add_foreign_key :bookmarks, :characters, column: :creator_id, primary_key: :character_id
  end
end
