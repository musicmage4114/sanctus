class EventResponse < ApplicationRecord
  # supplied parameter: string - response
  enum response: [:declined, :undecided, :tentative, :accepted]
  
  belongs_to :character, inverse_of: :event_responses
  belongs_to :event, inverse_of: :event_responses
end
