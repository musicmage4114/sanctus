class Bookmark < ApplicationRecord
  self.primary_key = 'bookmark_id'
  
  belongs_to :solar_system,   primary_key: :system_id,
                              inverse_of:  :bookmarks
  belongs_to :item,           foreign_key: :type_id,
                              primary_key: :type_id,
                              inverse_of:  :bookmarks,
                              optional:    true
  belongs_to :creator,        class_name:  'Character',
                              primary_key: :character_id,
                              inverse_of:  :bookmarks
  belongs_to :owner,          polymorphic: true
  belongs_to :folder,         class_name:  'BookmarksFolder',
                              primary_key: :folder_id,
                              inverse_of:  :bookmarks,
                              optional:    true
  
  alias_attribute :system, :solar_system
end
