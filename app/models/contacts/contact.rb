class Contact < ApplicationRecord
  # API data: boolean - is_blocked
  enum blocklist: [:not_blocked, :blocked]
  # API data: boolean - is_watched
  enum watchlist: [:not_watched, :watched]
  
  belongs_to :character,     primary_key: :character_id,
                             inverse_of:  :contacts
  belongs_to :diplomacy,     polymorphic: true
  belongs_to :contact_label, foreign_key: :label_id,
                             primary_key: :label_id,
                             inverse_of:  :contacts,
                             optional:    true
end
