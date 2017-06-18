class MailRecipient < ApplicationRecord
  # API data: boolean - read/is_read - obtained from get_mail or read_mail
  enum status: [:unread, :read]
  
  belongs_to :recipient, class_name:  'Character',
                         primary_key: :character_id,
                         inverse_of:  :mail_recipients
  belongs_to :evemail,   primary_key: :mail_id, inverse_of: :mail_recipients
end
