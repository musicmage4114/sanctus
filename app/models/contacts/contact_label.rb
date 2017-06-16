class ContactLabel < ApplicationRecord
  self.primary_key = 'label_id'
  
  belongs_to :character, primary_key: :character_id, inverse_of: :contact_labels
  
  has_many :contacts, foreign_key: :label_id, inverse_of: :contact_label
end
