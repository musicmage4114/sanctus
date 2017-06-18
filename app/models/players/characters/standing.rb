class Standing < ApplicationRecord
  belongs_to :character,    primary_key: :character_id,
                            inverse_of:  :standings
  belongs_to :relationship, polymorphic: true
end
