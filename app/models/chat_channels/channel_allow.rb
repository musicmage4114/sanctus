class ChannelAllow < ApplicationRecord
  belongs_to :chat_channel, foreign_key: :channel_id,
                            primary_key: :channel_id,
                            inverse_of:  :channel_allows
  belongs_to :allowed,      polymorphic: true
  
  alias_attribute :channel, :chat_channel
end
