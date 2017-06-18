class MedalAward < ApplicationRecord
  # API data: string - status
  enum viewable: { private: 1, public: 2 }
  
  belongs_to :character, primary_key: :character_id, inverse_of: :medal_awards
  belongs_to :medal,     primary_key: :medal_id,     inverse_of: :medal_awards
  belongs_to :issuer,    class_name:  'Character',
                         foreign_key: :issuer_id,
                         primary_key: :character_id,
                         inverse_of:  :medal_awards
end
