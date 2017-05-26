class CreateBookmarksFolders < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks_folders, id: false do |t|
      t.integer :folder_id, null: false, index: { unique: true }
      t.belongs_to :owner, polymorphic: true, index: true
      t.string :name
    end
  end
end
