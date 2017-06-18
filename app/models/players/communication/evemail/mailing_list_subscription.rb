class MailingListSubscription < ApplicationRecord
  belongs_to :mailing_list, primary_key: :mailing_list_id,
                            inverse_of:  :mailing_list_subscriptions
  belongs_to :subscriber,   class_name:  'Character',
                            primary_key: :character_id,
                            inverse_of:  :mailing_list_subscriptions
end
