class Standing < ApplicationRecord
  belongs_to :character, inverse_of: :standings
  belongs_to :relationship, polymorphic: true
end
