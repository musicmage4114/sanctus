class CreateBookmarksFolders < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks_folders, id: false do |t|
      t.integer    :folder_id, null: false, index: { unique: true }
      t.belongs_to :owner,     polymorphic: true, index: true
      t.string     :name
    end
    add_foreign_key :bookmarks, :bookmarks_folders, column: :folder_id,
                    primary_key: :folder_id
  end
end
