class KillmailItem < ApplicationRecord
  belongs_to :killmail,  inverse_of:  :killmail_items
  belongs_to :container, class_name:  'KillmailItem', optional: true
  belongs_to :item,      foreign_key: :type_id, inverse_of: :killmail_items
  
  has_many :contents, class_name:  'KillmailItem'
end
