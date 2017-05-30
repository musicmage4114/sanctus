class Event < ApplicationRecord
  self.primary_key = 'event_id'
  
  # supplied parameter: integer - importance
  # 1 = important, 0 = normal
  enum importance: [ :normal, :important ]
  
  belongs_to :host, polymorphic: true
  has_many :responses, class_name: 'EventResponse', inverse_of: :event
end
