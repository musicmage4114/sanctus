class MailLabelAssignment < ApplicationRecord
  belongs_to :label,   class_name:  'MailLabel', inverse_of: :mail_label_assignments
  belongs_to :evemail, foreign_key: :evemail_id, inverse_of: :mail_label_assignments
end
