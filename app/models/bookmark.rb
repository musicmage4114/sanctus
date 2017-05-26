class Bookmark < ApplicationRecord
  self.primary_key = 'bookmark_id'
  
  belongs_to :solar_system, foreign_key: :location_id, inverse_of: :bookmarks
  belongs_to :item, foreign_key: :type_id, inverse_of: :bookmarks, optional: true
  belongs_to :creator, class_name: 'Character', foreign_key: :creator_id, inverse_of: :bookmarks
  belongs_to :owner, polymorphic: true
  belongs_to :folder, class_name: 'BookmarksFolder', foreign_key: :folder_id, inverse_of: :bookmarks
end
