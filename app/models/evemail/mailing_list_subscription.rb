class MailingListSubscription < ApplicationRecord
  belongs_to :mailing_list, inverse_of: :mailing_list_subscriptions
  belongs_to :subscriber,   class_name: 'Character',
                            inverse_of: :mailing_list_subscriptions
end
