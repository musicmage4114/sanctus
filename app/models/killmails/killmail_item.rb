class KillmailItem < ApplicationRecord
  belongs_to :killmail,  primary_key: :killmail_id, inverse_of: :killmail_items
  belongs_to :container, class_name:  'KillmailItem',
                         foreign_key: :killmail_item_id,
                         optional:    true
  belongs_to :item,      foreign_key: :type_id,
                         primary_key: :type_id,
                         inverse_of:  :killmail_items
  
  has_many :contents, class_name:  'KillmailItem'
end
