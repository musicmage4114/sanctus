class MailRecipient < ApplicationRecord
  # API data: boolean - read/is_read - obtained from get_mail or read_mail
  enum status: [:unread, :read]
  
  belongs_to :recipient, class_name: 'Character', inverse_of: :mail_recipients
  belongs_to :evemail,   inverse_of: :mail_recipients
end
