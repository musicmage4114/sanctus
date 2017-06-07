class Evemail < ApplicationRecord
  self.primary_key = 'mail_id'
  
  belongs_to :sender,        class_name:  'Character',
                             foreign_key: :from_id,
                             inverse_of:  :evemails
  
  has_many :recipients,      class_name:  'MailRecipient',
                             foreign_key: :mail_id,
                             inverse_of:  :evemail
  has_many :assigned_labels, class_name:  'MailLabelAssignment',
                             foreign_key: :mail_id,
                             inverse_of:  :evemail
  
  alias_attribute :from, :sender
end
