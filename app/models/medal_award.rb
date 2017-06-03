class MedalAward < ApplicationRecord
  # API data: string - status
  enum viewable: { private: 1, public: 2 }
  
  belongs_to :character, inverse_of:  :medal_awards
  belongs_to :medal,     inverse_of:  :medal_awards
  belongs_to :issuer,    class_name:  'Character',
                         foreign_key: :issuer_id,
                         inverse_of:  :medal_awards
end
