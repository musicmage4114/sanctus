class MailingList < ApplicationRecord
  self.primary_key = 'mailing_list_id'
  
  belongs_to :creator, class_name:  'Character',
                       primary_key: :character_id,
                       inverse_of:  :mailing_lists,
                       optional:    true
  
  has_many :subscriptions, class_name: 'MailingListSubscription',
                           inverse_of: :mailing_list
  has_many :subscribers,   through:    :subscriptions,
                           source:     :subscriber
end
