class EventResponse < ApplicationRecord
  # API data: string - response
  enum response: [:declined, :undecided, :tentative, :accepted]
  
  belongs_to :character, primary_key: :character_id, inverse_of: :event_responses
  belongs_to :event,     primary_key: :event_id,     inverse_of: :event_responses
end
