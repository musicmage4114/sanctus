class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks, id: false do |t|
      t.integer :bookmark_id, null: false, index: { unique: true }
      t.belongs_to :creator, null: false, index: true
      t.belongs_to :folder, index: true
      t.datetime :create_date, null: false
      t.text :memo
      t.text :note
      t.belongs_to :owner, polymorphic: true, index: true
      t.belongs_to :location, null: false, index: true
      t.integer :item_id
      t.belongs_to :type_id, index: true
      
      # coordinates relative to solar system's sun
      t.float :x
      t.float :y
      t.float :z
    end
  end
end
