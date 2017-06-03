class Event < ApplicationRecord
  self.primary_key = 'event_id'
  
  # API data: integer - importance
  enum importance: [:normal, :important]
  
  belongs_to :host, polymorphic: true
  
  has_many :responses, class_name: 'EventResponse', inverse_of: :event
end
