class Contact < ApplicationRecord
  # supplied parameter: boolean - is_blocked
  # true -> 1 -> blocked, false -> 0 -> not_blocked
  enum blocklist: [:not_blocked, :blocked]
  # enum - supplied parameter: boolean - is_watched
  # true -> 1 -> watched, false -> 0 -> not_watched
  enum watchlist: [:not_watched, :watched]
  
  belongs_to :character, inverse_of: :contacts
  belongs_to :diplomacy, polymorphic: true
  belongs_to :contact_label, foreign_key: :label_id, inverse_of: :contacts, optional: true
end
