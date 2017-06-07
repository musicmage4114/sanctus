class MailLabel < ApplicationRecord
  self.primary_key = 'label_id'
  
  belongs_to :character,       inverse_of:  :mail_labels, optional: true
  
  has_many :assigned_evemails, class_name:  'MailLabelAssignment',
                               foreign_key: :label_id,
                               inverse_of:  :mail_label
  has_many :evemails,          through:     :mail_label_assignments, source: :mail
  
  alias_attribute :assigned, :assigned_evemails
end
