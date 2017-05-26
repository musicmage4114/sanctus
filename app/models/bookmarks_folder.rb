class BookmarksFolder < ApplicationRecord
  self.primary_key = 'folder_id'
  
  belongs_to :owner, polymorphic: true
  has_many :bookmarks, foreign_key: :folder_id, inverse_of: :bookmarks_folder
end
