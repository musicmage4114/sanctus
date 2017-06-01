class ChannelBlock < ApplicationRecord
  belongs_to :chat_channel, foreign_key: :channel_id, inverse_of: :channel_blocks
  belongs_to :blocked, polymorphic: true
  
  alias_attribute :channel, :chat_channel
end
