class War < ApplicationRecord
  self.primary_key = 'war_id'
  
  # API data: boolean - open_for_allies
  enum assistance: [:closed, :open]
  
  belongs_to :aggressor, polymorphic: true
  belongs_to :defender,  polymorphic: true
  
  has_many :allies, class_name: 'WarAlly', inverse_of: :war
end
