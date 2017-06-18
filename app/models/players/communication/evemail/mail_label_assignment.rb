class MailLabelAssignment < ApplicationRecord
  belongs_to :label,   class_name:  'MailLabel',
                       primary_key: :label_id,
                       inverse_of:  :mail_label_assignments
  belongs_to :evemail, primary_key: :mail_id,
                       inverse_of:  :mail_label_assignments
end
